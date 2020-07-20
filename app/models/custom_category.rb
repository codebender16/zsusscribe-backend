class CustomCategory < ApplicationRecord
  belongs_to :users
  belongs_to :categories
end
