class ParkingSpot < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings

  geocoded_by :street_address
  after_validation :geocode, if: :street_address_changed?


end
