class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :update]
  before_action :set_item, only:[:edit,:update]
  def index
    @items = Item.all.order("id DESC")
  end

  def new
   @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    if @item.save
    redirect_to root_path
    else
      render :new
    end
  end

  def edit
    if current_user.id != @item.user_id
      redirect_to root_path
    end
  end
  
  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :condition_id, :postage_payer_id, :prefecture_id, :handling_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end