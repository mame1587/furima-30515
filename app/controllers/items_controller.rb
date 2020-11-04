class ItemsController < ApplicationController
  def index
    @item = Item.new
    #@room = Room.find(params[:room_id])
    #@messages = @room.messages.includes(:user)
  end
end
