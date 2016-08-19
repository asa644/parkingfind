class ChangeBookintoBooking < ActiveRecord::Migration[5.0]
  def change
    rename_column :chat_rooms, :bookin_id, :booking_id
  end
end
