class PaymentsController < ApplicationController
  before_action :set_booking, except: :accepted



  def new
  end


  def create
    @total_price_cents = @booking.total_price_cents

    customer = Stripe::Customer.create(
      source: params[:stripeToken],
      email:  params[:stripeEmail],
    )

    @booking.update(status: 'paid')

    @user = current_user
    @user.customer_id = customer.id
    @user.save

    redirect_to bookings_path

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_booking_payment
  end


  def accepted
    @booking = Booking.where(status: 'pending').find(params[:id])

    if current_user.id == @booking.parking_spot.user.id && @booking.accepted!

    charge = Stripe::Charge.create(
      customer:     @booking.user.customer_id,   # You should store this customer id and re-use it.
      amount:       @booking.total_price_cents, # in cents
      description:  "Payment for teddy #{@booking.id} for booking #{@booking.id}",
      currency:     'eur'
    )

    @booking.update(payment: charge.to_json, status: 'accepted') #might change to "paid"
      respond_to do |format|
        format.html { redirect_to parking_spot_path(@booking.parking_spot), flash[:notice] = "Booking Accepted" }
        format.js  # <-- will render `app/views/bookings/accepted.js.erb`
      end
    end
  end


private


  def set_booking
    @booking = Booking.where(status: 'pending').find(params[:booking_id])
  end

end

