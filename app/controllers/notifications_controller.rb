class NotificationsController < ApplicationController

  def index
    @notifications = Notification.all
  end

  def destroy
    @notification = Notification.find(params[:id])
    @notification_id = @notification.id
    @notification.destroy
    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end
  end
end
