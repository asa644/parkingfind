class Review < ApplicationRecord
  belongs_to :booking
  # validates :rating, length: { maximum: 5 }
  validates :rating, :numericality => { :less_than_or_equal_to => 5 }, :presence => true
end
