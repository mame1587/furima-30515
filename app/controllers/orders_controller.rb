class OrdersController < ApplicationController
before_action :set_item, only:[:index, :create]


  def index
    @order = UserOrder.new
    # @item.order
    if current_user.id == @item.user_id || @item.order != nil
      redirect_to root_path
    end
  end

  def create
    @order = UserOrder.new(order_params)
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
    params.require(:user_order).permit(:post_code, :building_name, :phone_number, :house_number, :city, :prefectures_id).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end