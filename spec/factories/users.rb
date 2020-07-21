FactoryBot.define do
  factory :user do
    sequence :email do |n|
       "testuser#{n}@test.com" 
    end
    password { "password123" }
  end
end