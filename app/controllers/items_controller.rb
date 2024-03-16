class ItemsController < ApplicationController
  def index
    @items = Item.all
    @current_user = User.first # Simplification for example purposes
  end
end
