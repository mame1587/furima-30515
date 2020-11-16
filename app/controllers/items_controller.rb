class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @item = Item.all
    # @order = Oreder.find(params[:order_id])
  end

  def new
   @item = Item.new
  end

  def show
    @item = Item.new
  end

  def create
    # @order = Order.find(params[:order_id])
    @item = Item.new(item_params)
    @item.save
    redirect_to root_path
    # binding.pry
  end

  def edit
  end
  
  def update
    if current_user.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :condition_id, :postage_payer_id, :prefecture_id, :handling_id, :price).merge(user_id: current_user.id)
  end
end