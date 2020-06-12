# frozen_string_literal: true

class OrdersCreateJob < ShopJob
  def perform(shop_domain:, webhook:)
    p "#{shop.shopify_domain}: Just got an order"
    p webhook
  end
end
