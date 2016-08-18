class Booking < ApplicationRecord
  belongs_to :parking_spot
  belongs_to :user
  has_one :chat_room

  has_one :owner, through: :parking_spot, source: :user

  after_create :create_associated_chatroom

  private

  def create_associated_chatroom
    ChatRoom.create(booking_id: self.id)
  end

end
