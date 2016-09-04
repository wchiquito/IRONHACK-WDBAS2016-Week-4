class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
    @products_count = @products.count
  end

  def show
    product_id = @product.id
    @can_new_bids = @product.can_new_bids?
    @winning_bidder = Bid.winning_bidder product_id if !@can_new_bids
    @bids = @product.bids
    @min_amount = @product.calculate_minimum_amount
    @bid_new = Bid.new
    @bid_new.amount = @min_amount
  end

  def edit
  end

  def create
    @product = Product.new product_params
    if @product.save
      redirect_to product_path @product
    else
      render :new
    end
  end

  def update
    if @product.update product_params
      redirect_to product_path
    else
      render :edit
    end
  end

  def destroy
  end

  def new
    @product = Product.new
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find params[:id]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:title,
                                      :description,
                                      :deadline,
                                      :minimum_amount,
                                      :user_id)
    end
end
