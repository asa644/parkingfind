class Review < ApplicationRecord
  has_many :booking
  belongs_to :user
  belongs_to :parking_spot
end
