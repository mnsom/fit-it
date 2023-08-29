require "open-uri"
require "nokogiri"

class LayoutsController < ApplicationController

  def index
    @layouts = policy_scope(Layout).order(created_at: :desc)
    @layout = Layout.new
  end

  def edit
    @layout = Layout.find(params[:id])
    authorize @layout
    @item = Item.new
    @items = Item.where(user: current_user).or(Item.where(user: nil))
    @items_hash = @layout.registered_items.map do |rg_item|
      {
        width: rg_item.width,
        length: rg_item.length,
        icon_url: rg_item.icon_url,
        detail_url: rg_item.detail_url,
        id: rg_item.id,
        left: rg_item.x,
        top: rg_item.y,
        rotation: rg_item.rotation,
        title: rg_item.item.title
      }
    end
    if params[:url]
      result = ikea_fetch(params[:url])
      @item = Item.new(result)
      respond_to do |format|
        format.html
        format.text { render partial: "shared/ikea_form", locals: { layout: @layout, item: @item }, formats: [:html] }
      end
    end
  end

  # def update
  #   @layout = Layout.find(params[:id])
  #   @layout.update(layout_params)

  #   respond_to do |format|
  #     format.html { redirect_to movies_path }
  #     format.text { render partial: :index, locals: {movie: @movie}, formats: [:html] }
  #   end

  # end

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
    redirect_to layouts_path, status: :see_other
  end

  private

  def layout_params
    params.require(:layout).permit(:title, :photo)
  end

  def ikea_fetch(url)
    html_file = URI.open(url).read
    html_doc = Nokogiri::HTML.parse(html_file)

    img_url = html_doc.search(".pip-image").attribute("src").value
    item_element = html_doc.search(".pip-temp-price-module__information")
    title = item_element.search(".pip-header-section__title--big").text.strip
    dimensions = item_element.search(".pip-link-button.pip-header-section__description-measurement").text.strip
    width, length = dimensions.split("x")
    width.to_i
    length.to_i
    { title: title.split.first, d_width: width, d_length: length, url: url }
  rescue
    {}
  end
end
