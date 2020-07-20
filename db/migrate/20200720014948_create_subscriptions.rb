class CreateSubscriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :subscriptions do |t|
      t.string :name
      t.integer :payment_amount
      t.datetime :payment_date
      t.string :reminder
      t.datetime :expiry_date
      t.references :users, null: false, foreign_key: true

      t.timestamps
    end
  end
end
