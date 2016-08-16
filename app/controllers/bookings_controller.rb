class BookingsController < ApplicationController

  def new
    @booking = Booking.new
  end


  def create
    @booking = current_user.bookings.build(booking_params.merge(parking_spot_id: params[:parking_spot_id]))
    @booking.save
    redirect_to root_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_at, :end_at, :total_price)
  end
end

