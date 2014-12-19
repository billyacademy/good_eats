class ReviewsController < ApplicationController
    def new
      @review = Review.new
      @restaurant = Restaurant.find(params[:restaurant_id])
    end

    def create
      @review = Review.new(review_params)
      @restaurant = Restaurant.find(params[:restaurant_id])
      @review.restaurant_id = params[:restaurant_id]

      if @review.save
        redirect_to restaurant_path(@restaurant), notice: 'You have
        successfully submitted a review.'
      else
        redirect_to new_restaurant_review_path(params[:restaurant_id]), notice: "Please submit a rating between 1 and 5 and fill out the body"
      end
    end

    def index
    end

    private

    def review_params
      params.require(:review).permit(:rating, :body, :restaurant_id)
    end
end
