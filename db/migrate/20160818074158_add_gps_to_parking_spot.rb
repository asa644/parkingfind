class AddGpsToParkingSpot < ActiveRecord::Migration[5.0]
  def change
    add_column :parking_spots, :longitude, :float
    add_column :parking_spots, :latitude, :float
  end
end
