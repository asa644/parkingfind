class Booking < ApplicationRecord

#actives records relationships
  belongs_to :parking_spot
  belongs_to :user
  has_many :reviews
  has_one :chat_room
  has_one :owner, through: :parking_spot, source: :user

#allow stripe
  monetize :total_price_cents

#validations
  validates :start_at, presence: :true
  validates :end_at, presence: :true
  validate :booking_period_not_overlapped, on: :create

#chat room creation
  after_create :create_associated_chatroom

enum status: [:pending, :rejected, :accepted]


  def n_of_days
    total_days = (self.end_at.to_date - self.start_at.to_date) + 1
  end

  def t_price
    n_of_days * self.parking_spot.price_cents
  end

  def self.sum_price
      sum(:total_price_cents)
  end


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



