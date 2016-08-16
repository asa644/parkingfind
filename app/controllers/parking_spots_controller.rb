class ParkingSpotsController < ApplicationController

  def index
    @parkings = ParkingSpot.all
  end

  def show
    @parking = ParkingSpot.find(params[:id])
  end

  def new
    @parking = ParkingSpot.new
  end

  def create
    @parking = ParkingSpot.new(parking_params)
    @parking.save
    # redirect_to articles_path(@parking)
  end

  def edit
    @parking = ParkingSpot.find(params[:id])
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
    params.require(:ParkingSpot).permit(:street_address, :city, :country, :price, :type, :number_of_spots, :description)
  end
end
