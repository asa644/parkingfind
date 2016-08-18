class ChatRoomsController < ApplicationController

  def index
    @chat_rooms = ChatRoom.all
  end

  def show
    @chat_room = ChatRoom.includes(:messages).find_by(id: params[:id])
    @message = Message.new

    booking = Booking.find_by(id: params[:booking_id])
    if booking && (current_user == booking.user || current_user == booking.owner)
      @chat_room = booking.chat_room
    else
      redirect_to root_path
    end
  end

  private

  def chat_room_params
    params.require(:chat_room).permit(:title)
  end
end
