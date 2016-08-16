class ParkingSpotsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]
  before_action :find_user

  def index
    @parking_spots = ParkingSpot.all
    redirect_to profile_path
  end

  def show
    @parking_spot = current_user.parking_spots.find_by(id: params[:id])
    redirect_to parking_spots_path unless @parking_spot
  end

  def new
    @parking_spot = ParkingSpot.new
  end

  def create
    @parking_spot = @user.parking_spots.build(parking_params)
    @parking_spot.save
    redirect_to user_parking_spot_path(@user, @parking_spot)
  end

  def edit
    @parking = current_user.parking_spots.find_by(id: params[:id])
    redirect_to parking_spots_path unless @parking
  end

  def update
    @parking = ParkingSpot.find(params[:id])
    @parking.update(parking_params)
    # redirect_to articles_path
  end

  def destroy
    @parking = ParkingSpot.find(params[:id])
    @parking.destroy
    # redirect_to articles_path
  end

  private

  def find_user
    @user = current_user
  end

  def parking_params
    params.require(:parking_spot).permit(:street_address, :city, :country, :user_id, :price, :type, :number_of_spots, :description)
  end
end
