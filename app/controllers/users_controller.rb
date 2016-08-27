class UsersController < ApplicationController


  def show
    @user = current_user
  end

  def management
    @user = current_user
    @parking_spots = @user.parking_spots
    @segment = ParkingSpot.paginate(:page => params[:page], :per_page => 4)
  end


end
