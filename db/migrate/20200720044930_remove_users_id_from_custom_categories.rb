class RemoveUsersIdFromCustomCategories < ActiveRecord::Migration[6.0]
  def change
    remove_column :custom_categories, :users_id, :reference
  end
end
