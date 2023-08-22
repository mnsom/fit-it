class LayoutsController < ApplicationController

  def index
    @layouts = Layout.all
  end

  def edit
    @layout = User.find(params[:id])
  end

  def show
    @layout = User.find(params[:id])
  end
end
