class ParkingSpotsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]

  def index
    @parkings = ParkingSpot.all
  end

  def show
    # @parking = ParkingSpot.find(params[:id])
    # if current_user.id != @parking.user_id
    #   redirect_to parking_spots_path
    # else
    #   @parking
    # end
    @parking = current_user.parking_spots.find_by(id: params[:id])

    redirect_to parking_spots_path unless @parking
  end




  def new
    # @parking = ParkingSpot.new
    @parking = current_user.parking_spots.build
  end

  def create
    @parking = current_user.parking_spots.build(parking_params)
    # @parking = ParkingSpot.new(parking_params)
    @parking.save
    redirect_to parking_spot_path(@parking)
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

  def parking_params
    params.require(:parking_spot).permit(:street_address, :city, :country, :user_id, :price, :type, :number_of_spots, :description)
  end
end
