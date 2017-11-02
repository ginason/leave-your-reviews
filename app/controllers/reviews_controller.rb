class ReviewsController < ApplicationController
  attr_accessor :username, :comment

  def new
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new

  end
  def create
    # @review = Product.review.find(params[:product_id])
    puts "what ?"
    # @review = Review.new

    @product = Product.find(params[:product_id])
    puts "what ?"
    @review = @product.reviews.new(review_params)
    # @review = @product.reviews.new
    # @review.username = params[:review][:username]
    # @review.comment = params[:review][:comment]
    # @review.assign_attributess(review_params)
    @review.save

    if @review.save
      flash[:notice] = "sucessfully!"
      redirect_to product_url(@product)
    else
      flash.now[:error] = 'Sorry, try again!'
      render :review
      puts "what ?"
    end

  end

  private

  def review_params
    params.require(:review).permit(:username, :comment)
  end
end
