class UsersController < ApplicationController

  def show
    #check current user has same id as in route
    if current_user.id != params[:id].to_i
      redirect_to profile_path(current_user)
      return
    end
  end
end
