class Booking < ApplicationRecord
  belongs_to :parking_spot
  belongs_to :user
end
