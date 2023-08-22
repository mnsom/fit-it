class LayoutsController < ApplicationController

  def index
    @layouts = Layout.all
  end

  def edit
    @layout = Layout.find(params[:id])
  end
end
