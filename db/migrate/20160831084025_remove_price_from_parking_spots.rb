class RemovePriceFromParkingSpots < ActiveRecord::Migration[5.0]
  def change
    remove_column :parking_spots, :price
  end
end
