class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_parking_spot , except: [:index, :rejected, :accepted]
  before_action :find_booking , only: [:rejected, :accepted, :show]

  def index
    @user = current_user
    @bookings = Booking.paginate(:page => params[:page], :per_page => 8)
  end

  def new
    @booking = Booking.new
  end

  def show

      #@booking = Booking.where(status: 'paid').find(params[:id])

    # @booking = Booking.find_by_id_and_parking_spot_id(params[:id], @parking_spot.id)

  end

  def create
    @booking = current_user.bookings.build(booking_params)
    @booking.parking_spot_id = params[:parking_spot_id]
    @booking.total_price_cents = @booking.t_price
    @booking.number_of_days = @booking.n_of_days

    if @booking.save

      owner = @booking.parking_spot.user
      ownerr = owner.notifications.build(content: "You have a new booking for #{ view_context.link_to @booking.parking_spot.city, parking_spot_path(@booking.parking_spot.id), style: "color: #4CAF50" }, #{view_context.link_to "manage", management_path, style: "color:#4CAF50" } it" )

      if ownerr.save
        respond_to do |format|
        flash[:notice] = "Notifications"
        format.html
        format.js
        end
      end

      flash[:notice] = "Thank you for booking, Your booking time start at #{@booking.start_at} and ends at #{@booking.end_at} Your total price is: #{@booking.total_price}"
      redirect_to new_parking_spot_booking_payment_path(@parking_spot, @booking)
    else
      render :new
    end
  end

  def rejected
     # security
    if current_user.id == @booking.parking_spot.user.id && @booking.rejected!


      book = @booking.user
      bookk = book.notifications.create(content: "You have a new booking #{@booking.id}, for #{@booking.parking_spot.city}")


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

