FactoryBot.define do
  factory :subscription do
    name {'Netflix'}
    # change to float
    payment_amount {13}
    payment_date {'20/07/20'}
    reminder {'14 days'}
    expiry_date {'22/08/20'}

    association :user 

  end
end