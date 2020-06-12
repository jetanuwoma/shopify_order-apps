# frozen_string_literal: true

class OrdersPaidJob < ShopJob
  def perform(shop_domain:, webhook:)
    p "#{shop.shopify_domain}: Order has been paid"
    p webhook
  end
end
