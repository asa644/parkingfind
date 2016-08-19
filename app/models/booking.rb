class Booking < ApplicationRecord
  belongs_to :parking_spot
  belongs_to :user
  has_one :review
  # belongs_to :review
end
