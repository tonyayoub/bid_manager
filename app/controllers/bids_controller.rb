class BidsController < ApplicationController
  def new
    @item = Item.find(params[:item_id])
    @bid = Bid.new
  end

  def create
    @bid = Bid.new(bid_params)
    currency = params[:currency]
    @bid.amount = CurrencyConverter.convert(@bid.amount.to_f, currency)
    @bid.user = User.first
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
    currency = params[:currency]
    converted_amount = CurrencyConverter.convert(bid_params[:amount].to_f, currency)
    if @bid.update(amount: converted_amount, item_id: bid_params[:item_id])
      redirect_to root_path, notice: 'Bid was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @bid = Bid.find(params[:id])
    @bid.destroy

    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Bid was successfully destroyed.' }
    end
  end

  private

  def bid_params
    params.require(:bid).permit(:amount, :item_id)
  end
end
