class Category < ApplicationRecord
    has_many :customcategories
    has_many :subscriptions, through: :customcategories
end
