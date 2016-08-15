class CreateParkingSpots < ActiveRecord::Migration[5.0]
  def change
    create_table :parking_spots do |t|
      t.string :street_address
      t.string :city
      t.string :country
      t.references :user, foreign_key: true
      t.float :price
      t.string :type
      t.integer :number_of_spots
      t.text :description

      t.timestamps
    end
  end
end
