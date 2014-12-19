class RestaurantsController < ApplicationController
  def index
    @all_restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant), notice: "You have successfully
      added a new retaurant"
    else
      render new_restaurant_path(@restaurant), notice: "Fill out all form fields"
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @reviews = Review.where(restaurant_id: @restaurant[:id])
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :city, :state, :zipcode,
    :description, :category)
  end

end
