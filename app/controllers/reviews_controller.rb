class ReviewsController < ApplicationController
  attr_accessor :name, :comment
  def new
    @review = Review.new
  end
  def create
    # @review = Product.review.find(params[:product_id])
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new
    @review.assign_attributes(review_params)

    if @review.save
      redirect_to product_path(@review)
    else
      render :create
    end

  end
  private
  def review_params
    params.require(:review).permit(:name, :comment)
  end
end
