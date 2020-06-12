FactoryBot.define do
  factory :narwhal_order do
    order_id { "MyString" }
    customer { "MyString" }
    order_name { "MyString" }
    shop { nil }
  end
end
