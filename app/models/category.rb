class Category < ApplicationRecord
  has_many :custom_categories
  has_many :subscriptions
  # belongs_to :user, through: :custom_categories
end
