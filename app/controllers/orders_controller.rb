class OrdersController < ApplicationController

  def index
    @item = Item.new
    @order = Order.find(params[:item_id])
    @items = @item.orders.includes(:user)
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private
  def order_params
    params.require(:order).permit(:image).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = "sk_test_"
    Payjp::Charge.create(
      amount: order_params[:price],  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end