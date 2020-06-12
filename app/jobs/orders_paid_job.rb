# frozen_string_literal: true
class OrdersPaidJob < ShopJob
  def perform(shop_domain:, webhook:)
    p "creating order for #{shop_domain}"
    search = webhook[:line_items].select { |item| item[:name].match(/narwhal/i) }
    return if search.empty?

    order = build_order(webhook)
    shop.narwhal_orders << order
  end
end
