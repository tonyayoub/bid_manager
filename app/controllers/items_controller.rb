class ItemsController < ApplicationController
  helper_method :convert_currency
  def index
    @items = Item.all
    @current_user = User.first
  end

  def change_currency
    session[:currency] = params[:currency]
    redirect_to root_url
  end

  def convert_currency(amount, currency)
    converted_amount = CurrencyConverter.convert_to(amount, currency)
    [converted_amount, currency]
  end
end
