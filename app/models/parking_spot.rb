class ParkingSpot < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings

  geocoded_by :street_address
  after_validation :geocode, if: :street_address_changed?

  def unavailable_dates
    impossible_dates = []
    date_ranges = self.bookings.map { |x| (x.start_at..x.end_at)}
    date_ranges.each do |range|
      range.map do |date|
        impossible_dates << date.strftime("%d/%m/%Y")
      end
    end
    impossible_dates
  end
end
