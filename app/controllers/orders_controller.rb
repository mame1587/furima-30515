# class OrdersController < ApplicationController

#   def index
#     @item = Item.new
#     @order = Order.find(params[:item_id])
#     @items = @item.orders.includes(:user)
#   end

#   private
#   def order_params
#     params.require(:order).permit(:image).merge(user_id: current_user.id)
#   end
# end
