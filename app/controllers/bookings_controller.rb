class BookingsController < ApplicationController
  before_action :find_parking_spot
  # def index
  #   @user = current_user
  #   @bookings = @user.bookings
  # end

  # def show
  #   @booking = booking.find(params[:id])
  # end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.save
    # redirect_to articles_path(@booking)
  end

  # def edit
  #   @booking = booking.find(params[:id])
  # end

  # def update
  #   @booking = booking.find(params[:id])
  #   @booking.update(booking_params)
  #   # redirect_to articles_path
  # end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    # redirect_to articles_path
  end

  private

  def find_booking
    @booking = ParkingSpot.find(params[:parking_spot_id])
  end

  def booking_params
    params.require(:booking).permit(:start_at, :end_at, :total_price)
  end
end
