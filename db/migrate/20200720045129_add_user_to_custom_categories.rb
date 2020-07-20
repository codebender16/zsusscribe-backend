class AddUserToCustomCategories < ActiveRecord::Migration[6.0]
  def change
    add_reference :custom_categories, :user, null: false, foreign_key: true
  end
end
