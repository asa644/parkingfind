class AddPhotoToParkingSpots < ActiveRecord::Migration[5.0]
  def change
    add_column :parking_spots, :photo, :string
  end
end
