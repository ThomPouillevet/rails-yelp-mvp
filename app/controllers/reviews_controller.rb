class ReviewsController < ApplicationController

def new
    # we need @restaurant in our `simple_form_for`
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(restaurant: @restaurant)
    # @review = @restaurant.reviews.build()
    # @review.restaurant = @restaurant
  end

  def create
    @review = Review.new(review_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    # we need `restaurant_id` to asssociate review with corresponding restaurant
    @review.restaurant = Restaurant.find(params[:restaurant_id])
    respond_to do |format|
      if @review.save
        format.html { redirect_to restaurant_path(@review.restaurant), notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @review.restaurant }
      else
        format.html { render :new }
        format.json { render json: @review.restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end

end
