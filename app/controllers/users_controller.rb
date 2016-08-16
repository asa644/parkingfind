class UsersController < ApplicationController

  def show
    #check current user has same id as in route
    @user = current_user
  end
end
