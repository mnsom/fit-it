class LayoutsController < ApplicationController

  def index
    @layouts = policy_scope(Layout)
    @layout = Layout.new
  end

  def edit
    @layout = Layout.find(params[:id])
    authorize @layout
    @item = Item.new
    @items = Item.all
    @items_hash = @layout.registered_items.map do |rg_item|
      {
        url: rg_item.icon_url,
        left: rg_item.x,
        top: rg_item.y
      }
    end
  end

  def create
    @layout = Layout.new(layout_params)
    @layout.user = current_user
    authorize @layout
    if @layout.save
      redirect_to layouts_path(@layouts)
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def layout_params
    params.require(:layout).permit(:title, :photo)
  end
end
