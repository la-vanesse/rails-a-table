class ReviewsController < ApplicationController
  before_action :set_product, only: %i[new create]

  def index
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.product = @product
    @review.user = current_user
    if @review.save
      redirect_to product_path(@product)
    else
      render 'products/:id/reviews/new', alert: 'Invalid Review. Review not saved'
    end
  end

  def show; end

  private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end

  def set_product
    @product = Product.find(params[:product_id])
  end
end
