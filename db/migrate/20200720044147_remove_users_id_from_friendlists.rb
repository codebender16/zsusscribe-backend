class RemoveUsersIdFromFriendlists < ActiveRecord::Migration[6.0]
  def change
    remove_column :friendlists, :users_id, :reference
  end
end
