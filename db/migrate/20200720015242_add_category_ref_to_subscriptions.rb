class AddCategoryRefToSubscriptions < ActiveRecord::Migration[6.0]
  def change
    add_reference :subscriptions, :categories, null: false, foreign_key: true
  end
end
