class BidsController < ApplicationController
  def new
    @item = Item.find(params[:item_id])
    @bid = Bid.new
  end

  def create
    @bid = Bid.new(bid_params)
    @bid.user = User.first
    if @bid.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @bid = Bid.find(params[:id])
  end

  def update
    @bid = Bid.find(params[:id])
    if @bid.update(bid_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def bid_params
    params.require(:bid).permit(:amount, :item_id)
  end
end
