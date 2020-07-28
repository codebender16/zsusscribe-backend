class Subscription < ApplicationRecord
  attr_accessor :category_name
  belongs_to :user
  validates :name, presence: true 
  validates :name, length: { minimum: 1, maximum: 20 }
  validates :payment_amount, presence: true 
  validates :payment_date, presence: true 
  belongs_to :category
end
