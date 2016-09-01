class AddTotalPriceToBookings < ActiveRecord::Migration[5.0]
  def change
    add_monetize :bookings, :total_price, currency: { present: false }
  end
end
