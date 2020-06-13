FactoryGirl.define do
  factory :shop do
    shopify_domain { 'some.shop.com' }
    shopify_token { '589304583' }
  end
end