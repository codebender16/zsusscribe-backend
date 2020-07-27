class Category < ApplicationRecord
  has_many :custom_categories
  has_one :subscription
  # belongs_to :user, through: :custom_categories
end
