FactoryBot.define do
  factory :subscription do
    sequence :name do |n| 
      "Factory Test Trail no.#{n}" 
    end
    name {'Netflix'}
    payment_amount {20}
    payment_date {'20/07/20'}
    reminder {'14 days'}
    expiry_date {'22/08/20'}

    association :user

  end
end