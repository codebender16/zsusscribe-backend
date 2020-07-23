class AddCategoryToSubscriptions < ActiveRecord::Migration[6.0]
  def change
    add_reference :subscriptions, :category, null: true, foreign_key: true
  end
end
