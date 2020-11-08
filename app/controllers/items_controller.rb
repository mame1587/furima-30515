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
private
  def item_params
  params.require(:item).permit(:name, :image, :text)
  end
private

def private_method
  
end
def any_method

end
end
