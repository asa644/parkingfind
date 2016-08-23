class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_parking_spot , except: [:index, :show, :rejected, :accepted]
  before_action :find_booking , only: [:rejected, :accepted, :show]

  def index
    @user = current_user
  end

  def new
    @booking = Booking.new
  end

  def show
  end

  def create
    @booking = current_user.bookings.build(booking_params)
    @booking.parking_spot_id = params[:parking_spot_id]

    if @booking.save
      owner = @booking.parking_spot.user
      owner.notifications.create(content: "You have a new booking #{@booking.id}, for #{@booking.parking_spot.city}")
      flash[:notice] = "Thank you for booking, Your booking time start at #{@booking.start_at} and ends at #{@booking.end_at} Your total price is: #{@booking.total_price}"
      redirect_to parking_spot_bookings_path
    else
      render :new
    end
  end

  def rejected
     # security
    if current_user.id == @booking.parking_spot.user.id && @booking.rejected!

      respond_to do |format|
        format.html { redirect_to parking_spot_path(@booking.parking_spot), flash[:notice] = "Booking Rejected" }
        format.js  # <-- will render `app/views/bookings/rejected.js.erb`
      end
    end
  end



  def accepted
    # security
    if current_user.id == @booking.parking_spot.user.id && @booking.accepted!

      respond_to do |format|
        format.html { redirect_to parking_spot_path(@booking.parking_spot), flash[:notice] = "Booking Accepted" }
        format.js  # <-- will render `app/views/bookings/accepted.js.erb`
      end
    end
    #@booking.accepted!
    #redirect_to parking_spot_path(@booking.parking_spot)
    #flash[:notice] = "Booking Accepted"
  end


  def total_price
    @booking.total_price = total_price
    total_price = (@booking.end_at - @booking.start_at) * find_parking_spot.price
  end

  private

  def find_parking_spot
    @parking_spot = ParkingSpot.find(params[:parking_spot_id])
  end

  def booking_params
    params.require(:booking).permit(:start_at, :end_at)
  end

  def find_booking
    @booking = Booking.find(params[:id])
  end
end

