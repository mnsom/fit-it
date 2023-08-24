class RegisteredItemsController < ApplicationController
  def create
    @item = Item.find(params[:item_id])
    @registered_item = RegisteredItem.new
    @registered_item.item = @item
    @layout = Layout.find(params[:layout_id])
    @registered_item.layout = @layout
    authorize @registered_item
    @registered_item.save
    redirect_to edit_layout_path(@layout)
  end
end
