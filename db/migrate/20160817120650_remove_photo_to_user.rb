class RemovePhotoToUser < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :photo, :string
  end
end
