class BidsController < ApplicationController
  def new
    @item = Item.find(params[:item_id])
    @bid = Bid.new
  end

  def create
    @bid = Bid.new(bid_params)
    # Fetch the currency directly from params
    currency = params[:currency]
    # Convert the amount to SEK if the currency is not SEK
    @bid.amount = CurrencyConverter.convert(@bid.amount.to_f, currency)
    @bid.user = User.first # This should eventually be replaced with your actual user management logic
    if @bid.save
      redirect_to root_path, notice: 'Bid was successfully created.'
    else
      render :new
    end
  end

  def edit
    @bid = Bid.find(params[:id])
    @item = @bid.item
  end

  def update
    @bid = Bid.find(params[:id])
    # Perform currency conversion on the updated amount before saving
    currency = params[:currency]
    converted_amount = CurrencyConverter.convert(bid_params[:amount].to_f, currency)
    if @bid.update(amount: converted_amount, item_id: bid_params[:item_id])
      redirect_to root_path, notice: 'Bid was successfully updated.'
    else
      render :edit
    end
  end

  private

  def bid_params
    params.require(:bid).permit(:amount, :item_id)
    # Note: :currency is intentionally left out of the permitted parameters since it's not being saved to the model
  end
end
