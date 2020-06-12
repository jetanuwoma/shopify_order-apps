# frozen_string_literal: true

# ShopJob
class ShopJob < ActiveJob::Base
  queue_as :default
  sidekiq_options retry: 1
  around_perform :with_shopify_session

  private

  def with_shopify_session
    shop.with_shopify_session do
      yield
    end
  end

  def build_order(webhook)
    NarwhalOrder.where(order_id: webhook[:id]).first_or_create(
      {
        order_id: webhook[:id],
        order_name: webhook[:order_number],
        customer: "#{webhook[:customer][:first_name]} #{webhook[:customer][:last_name]}"
      }
    )
  end

  def shop
    @shop ||= ::Shop.find_by!(shopify_domain: shop_domain)
  end

  def shop_domain
    params_hash = arguments.last

    if params_hash.is_a?(Hash) && params_hash[:shop_domain].present?
      params_hash[:shop_domain]
    else
      arguments.first
    end
  end
end
