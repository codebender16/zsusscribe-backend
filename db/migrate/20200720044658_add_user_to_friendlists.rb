class AddUserToFriendlists < ActiveRecord::Migration[6.0]
  def change
    add_reference :friendlists, :user, null: false, foreign_key: true
  end
end
