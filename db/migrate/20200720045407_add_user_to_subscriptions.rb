class AddUserToSubscriptions < ActiveRecord::Migration[6.0]
  def change
    add_reference :subscriptions, :user, null: false, foreign_key: true
  end
end
