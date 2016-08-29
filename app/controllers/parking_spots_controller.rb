class ParkingSpotsController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: [ :index, :search ]
  before_action :find_user

  def index
    @parking_spots = ParkingSpot.all

    @parking_spots = ParkingSpot.where.not(latitude: nil, longitude: nil)
    @parking_spots = ParkingSpot.paginate(:page => params[:page], :per_page => 4)

    @hash = Gmaps4rails.build_markers(@parking_spots) do |flat, marker|
      marker.lat flat.latitude
      marker.lng flat.longitude
    end
  end

  def show
    @parking_spot = ParkingSpot.find(params[:id])
    # @parking_spot = current_user.parking_spots.find_by(id: params[:id])
    # @parking_spots = ParkingSpot.where.not(latitude: nil, longitude: nil)
    @parking_spot_coordinates = { lat: @parking_spot.latitude, lng: @parking_spot.longitude }
    @hash = Gmaps4rails.build_markers(@parking_spots) do |parking, marker|
      marker.lat parking.latitude
      marker.lng parking.longitude
    end

    # redirect_to profile_path unless @parking_spot
  end

  def new
    @parking_spot = ParkingSpot.new
  end

  def create
    @parking_spot = @user.parking_spots.build(parking_params)
    @parking_spot.save
    redirect_to parking_spot_path(@parking_spot)
  end

  def edit
    @parking_spot = current_user.parking_spots.find_by(id: params[:id])
    redirect_to root_path unless @parking_spot
  end

  def update
    @parking_spot = ParkingSpot.find(params[:id])
    @parking_spot.update(parking_params)
    # redirect_to articles_path
  end

  def destroy
    @parking_spot = ParkingSpot.find(params[:id])
    @parking_spot.destroy
    redirect_to profile_path
  end

  def search
    #perform your search
    @parking_spots = ParkingSpot.all.where("city ILIKE ? OR country ILIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")
    @parking_spots = ParkingSpot.paginate(:page => params[:page], :per_page => 4)

    @hash = Gmaps4rails.build_markers(@parking_spots) do |parking, marker|
      marker.lat parking.latitude
      marker.lng parking.longitude
    end
  end

  private

  def find_user
    @user = current_user
  end

  def parking_params
    params.require(:parking_spot).permit(:street_address, :city, :country, :latitude, :longitude, :user_id, :price, :type, :number_of_spots, :description, :photo, :photo_cache)
  end
end
