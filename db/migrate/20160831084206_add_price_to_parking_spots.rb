class AddPriceToParkingSpots < ActiveRecord::Migration[5.0]
  def change
    add_monetize :parking_spots, :price, currency: { present: false }
  end
end
