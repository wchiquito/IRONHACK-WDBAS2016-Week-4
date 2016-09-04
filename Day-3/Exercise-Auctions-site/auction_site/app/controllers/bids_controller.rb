class BidsController < ApplicationController
  def create
    @user = User.find_by_email params[:user_email]
    @bid_new = Bid.new bid_params
    @product = Product.find @bid_new.product_id
    @bid_new.user_id = @user.id unless @user.nil?
    if @bid_new.save
      redirect_to product_path @bid_new.product_id
    else
      @can_new_bids = @product.can_new_bids?
      @bids = @product.bids
      @min_amount = @product.calculate_minimum_amount
      render 'products/show'
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def bid_params
      params.require(:bid).permit(:product_id,
                                  :amount)
    end
end