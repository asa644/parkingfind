class RemoveTypeFromParkingSpots < ActiveRecord::Migration[5.0]
  def change
    remove_column :parking_spots, :type, :string
  end
end
