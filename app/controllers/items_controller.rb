class ItemsController < ApplicationController
  def index
    @items = Item.all
    @current_user = User.first
  end
end
