class ItemsController < ApplicationController
  def create
    @items = Item.where(user: current_user).or(Item.where(user: nil))
    @item = Item.new(item_params)
    @item.user = current_user
    @layout = Layout.find(params[:layout_id])
    authorize @item
    if @item.save
      redirect_to edit_layout_path(@layout, item_created: true)
    else
      @popup = true
      render 'layouts/edit', status: :unprocessable_entity
    end
  end

  def destroy
    @item = Item.find(params[:id])
    layout = Layout.find(params[:layout_id])
    authorize @item
    @item.destroy
    redirect_to edit_layout_path(layout)
  end

  private

  def item_params
    params.require(:item).permit(:title, :d_length, :d_width, :icon_id)
  end
end
