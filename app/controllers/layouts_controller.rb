require "open-uri"

class LayoutsController < ApplicationController

  def index
    @layouts = policy_scope(Layout)
    @layout = Layout.new
  end

  def edit
    @layout = Layout.find(params[:id])
    authorize @layout
    @item = Item.new
    @items = Item.where(user: current_user).or(Item.where(user: nil))
    @items_hash = @layout.registered_items.map do |rg_item|
      {
        url: rg_item.icon_url,
        left: rg_item.x,
        top: rg_item.y
      }
    end
  end

  def create
    @layouts = Layout.where(user: current_user)
    @layout = Layout.new(layout_params)
    @layout.user = current_user
    authorize @layout
    if @layout.save
      redirect_to layouts_path(@layouts)
    else
      render :index, status: :unprocessable_entity
    end
  end

  def duplicate
    # find the old one from the ID in the params
    @layout = Layout.find(params[:id])
    # duplicate it
    @new_layout = @layout.dup
    file = URI.open(@layout.photo.url)
    @new_layout.photo.attach(io: file, filename: "image.jpg", content_type: "image/jpg")
    authorize @new_layout
    @new_layout.save
    redirect_to layouts_path # for example
  end


  def destroy
    @layout = Layout.find(params[:id])
    authorize @layout
    @layout.destroy
    redirect_to layouts_path
  end

  private

  def layout_params
    params.require(:layout).permit(:title, :photo)
  end
end
