class CreateFriendlists < ActiveRecord::Migration[6.0]
  def change
    create_table :friendlists do |t|
      t.references :users, null: false, foreign_key: true
      t.integer :friend_id

      t.timestamps
    end
  end
end
