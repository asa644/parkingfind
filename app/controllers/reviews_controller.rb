class ReviewsController < ApplicationController
  def new
    @booking = Booking.find(params[:booking_id])
    @review = Review.new
  end

  def create
    @booking = Booking.find(params[:booking_id])
    @review = @booking.build_review(review_params)
    @review.save
    redirect_to parking_spot_path(@booking.parking_spot)
  end

  private

  def review_params
    params.require(:review).permit(:description)
  end
end
