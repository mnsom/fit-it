class ItemsController < ApplicationController
  def create
    @item = Item.new(item_params)
    @item.user = current_user
    if @item.save
      redirect_to edit_layout_path(@layout)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :d_length, :d_width, :icon_id)
  end
end
