class RemoveCategoriesIdFromCustomCategories < ActiveRecord::Migration[6.0]
  def change
    remove_column :custom_categories, :categories_id, :reference
  end
end
