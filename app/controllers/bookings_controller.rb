class BookingsController < ApplicationController
  before_action :find_parking_spot
  def index
    @bookings =  Booking.all
  end

  def new
    @booking = Booking.new
  end


  def create
    @booking = @parking_spot.bookings.build(booking_params)
    @booking.save
    flash[:notice] = 'Booking created successfully'
    #redirect to user booking show
    redirect_to parking_spot_bookings_path
  end

  private

  def find_parking_spot
    @parking_spot = ParkingSpot.find(params[:parking_spot_id])
  end

  def booking_params
    params.require(:booking).permit(:start_at, :end_at, :total_price).merge(user: current_user)
  end
end

