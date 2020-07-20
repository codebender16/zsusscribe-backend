class RemoveCategoriesIdFromSubscriptions < ActiveRecord::Migration[6.0]
  def change
    remove_column :subscriptions, :categories_id, :reference
  end
end
