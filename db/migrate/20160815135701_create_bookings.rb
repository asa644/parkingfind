class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.datetime :start_at
      t.datetime :end_at
      t.references :parking_spot, foreign_key: true
      t.references :user, foreign_key: true
      t.float :total_price

      t.timestamps
    end
  end
end
