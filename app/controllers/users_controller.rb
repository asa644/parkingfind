class UsersController < ApplicationController


  def show
    @user = current_user
  end

  def management
    @user = current_user
    @parking_spots = @user.parking_spots
  end


end
