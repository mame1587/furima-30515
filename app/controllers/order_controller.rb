class OrderController < ApplicationController
  def index
  end
 
  def new
    @user_order = UserOrder.new
  end
 
  def create
    @user_order = UserOrder.new(order_params)   #「UserDonation」に編集
     if @user_order.valid?
       @user_order.save
       redirect_to action: :index
     else
       render action: :new
     end
  end
 
  private
   # 全てのストロングパラメーターを1つに統合
  def order_params
   params.require(:user_order).permit(:name, :name_reading, :nickname, :postal_code, :prefecture, :city, :house_number, :building_name, :price)
  end
 
 end
end
