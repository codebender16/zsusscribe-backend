class Category < ApplicationRecord
  has_many :custom_categories
  # belongs_to :user, through: :custom_categories
end
