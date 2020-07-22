class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  has_many :subscriptions
  has_many :custom_categories
  has_many :categories, through: :custom_categories
end
