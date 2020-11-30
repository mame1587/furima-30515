class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @order = UserOrder.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order = UserOrder.new(order_params)
    if @order.valid?
      # pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private
  def order_params
    params.require(:user_order).permit(:post_code, :building_name, :phone_number, :house_number, :city, :prefectures_id).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  # def pay_item
  #   Payjp.api_key = "sk_test_"
  #   Payjp::Charge.create(
  #     amount: order_params[:price],  # 商品の値段
  #     card: order_params[:token],    # カードトークン
  #     currency: 'jpy'                 # 通貨の種類（日本円）
  #   )
  # end
end