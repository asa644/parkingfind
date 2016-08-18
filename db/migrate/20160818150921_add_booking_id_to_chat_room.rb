class AddBookingIdToChatRoom < ActiveRecord::Migration[5.0]
  def change
    add_column :chat_rooms, :bookin_id, :integer
    remove_column :chat_rooms, :user_id
  end
end
