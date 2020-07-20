class RemoveUsersIdFromSubscriptions < ActiveRecord::Migration[6.0]
  def change
    remove_column :subscriptions, :users_id, :reference
  end
end
