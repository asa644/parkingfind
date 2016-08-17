class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_parking_spot


  def index
    @bookings =  Booking.all
  end

  def new
    @booking = Booking.new
  end


  def create
    @booking = current_user.bookings.build(booking_params)
    @booking.parking_spot_id = params[:parking_spot_id]
    @booking.total_price = total_price
    @booking.save
    flash[:notice] = 'Booking created successfully'
    #redirect to user booking show
    redirect_to parking_spot_bookings_path
  end

  def total_price
    total_price = (@booking.end_at - @booking.start_at)/86400 * find_parking_spot.price
  end

  private

  def find_parking_spot
    @parking_spot = ParkingSpot.find(params[:parking_spot_id])
  end

  def booking_params
    params.require(:booking).permit(:start_at, :end_at)
  end
end

