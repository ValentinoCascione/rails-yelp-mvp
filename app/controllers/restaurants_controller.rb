class RestaurantsController < ApplicationController
  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.create!(params.require(:restaurant).permit(:name, :address, :phone_number, :category))
    redirect_to restaurants_path
  end

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @reviews = Review.all.where(restaurant_id: params[:id])
  end
end
