class ChangeNameToBookings < ActiveRecord::Migration[5.0]
  def change
    remove_column :bookings, :total_price
  end
end
