class ItemsController < ApplicationController
  
  def index
    @item = Item.all
    # @order = Oreder.find(params[:order_id])
  end
  
  def show
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  def edit
  end
  
  def update
    if current_user.update(item_params)
      redirect_to root_path
    else
      render :edit
  end

private
  def item_params
  params.require(:item).permit(:content, :image).merge(user_id: current_user.id)
  end
end
end