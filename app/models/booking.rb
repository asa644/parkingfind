class Booking < ApplicationRecord

#actives records relationships
  belongs_to :parking_spot
  belongs_to :user
  has_many :reviews
  has_one :chat_room
  has_one :owner, through: :parking_spot, source: :user

#validations
  validates :start_at, presence: :true
  validates :end_at, presence: :true
  validate :booking_period_not_overlapped

#chat room creation
  after_create :create_associated_chatroom

  enum status: [:pending, :rejected, :accepted]

  private

# Creates chatroom for each booking
  def create_associated_chatroom
    ChatRoom.create(booking_id: self.id)
  end


# check that it's not overlapping with another booking.
  def booking_period_not_overlapped
    parking_spot = self.parking_spot
    unless parking_spot.bookings.where(
      '(start_at <= ? AND end_at >= ?) OR (start_at >= ? AND start_at <= ?)',
      start_at, start_at,
      start_at, end_at
      ).empty?
      errors.add(:start_at, 'Parking already book at this period. Please choose another')
    end
  end

end



