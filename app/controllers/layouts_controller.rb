class LayoutsController < ApplicationController

  def index
    @layouts = policy_scope(Layout)
    @layout = Layout.new
  end

  def edit
    @layout = Layout.find(params[:id])
    authorize @layout
    @item = Item.new
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
