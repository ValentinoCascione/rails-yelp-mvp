class ReviewsController < ApplicationController
  def index
    @reviews = Review.all.where(restaurant_id: params[:restaurant_id])
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    raise
    @review = Review.new(params.require(:review).permit(:content, :rating))
    @review.restaurant_id = @restaurant.id
    @review.save!
    redirect_to restaurant_path(@restaurant.id)
  end
end
