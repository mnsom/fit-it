class LayoutsController < ApplicationController

  def index
    @layouts = Layout.all
    @layout = Layout.new
  end

  def edit
    @layout = Layout.find(params[:id])
  end

  def create
    @layout = Layout.new(layout_params)
    @layout.user = current_user
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
