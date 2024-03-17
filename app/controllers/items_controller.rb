class ItemsController < ApplicationController
  helper_method :convert_currency
  def index
    @items = Item.all
    @current_user = User.first
    session[:indexCurrency] ||= 'SEK'
  end

  def change_currency
    session[:currency] = params[:currency]
    redirect_to root_url
  end

  def convert_currency(amount, currency)
    # Dummy conversion rates - you may want to replace these with real ones or a service
    rates = {'SEK' => 1, 'EUR' => 0.1, 'USD' => 0.12}
    converted_amount = amount * rates[currency]
    [converted_amount, currency]
  end
end
