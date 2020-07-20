class AddCategoryToCustomCategories < ActiveRecord::Migration[6.0]
  def change
    add_reference :custom_categories, :category, null: false, foreign_key: true
  end
end
