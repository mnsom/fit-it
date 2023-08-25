class RegisteredItemsController < ApplicationController
  def create
    @item = Item.find(params[:item_id])
    @registered_item = RegisteredItem.new
    @registered_item.item = @item
    @layout = Layout.find(params[:layout_id])
    @registered_item.layout = @layout
    authorize @registered_item
    @registered_item.save
    redirect_to edit_layout_path(@layout, item_created: true)
  end

  def update
    @registered_item = RegisteredItem.find(params[:id])
    authorize @registered_item
    @registered_item.update(registered_items_params)
    head :ok
    # respond_to do |format|
    #   format.html { redirect_to }
    #   format.text { render partial: :index, locals: {movie: @movie}, formats: [:html] }
    # end
  end

  def destroy
    @registered_item = RegisteredItem.find(params[:id])
    authorize @registered_item
    @registered_item.destroy
    redirect_to edit_layout_path(@registered_item.layout), status: :see_other
  end

  private

  def registered_items_params
    params.require(:registered_item).permit(:x, :y, :rotation)
  end
end
