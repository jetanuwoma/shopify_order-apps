# frozen_string_literal: true

class AuthenticatedController < ApplicationController
  include ShopifyApp::Authenticated

  def curr_shop
    @curr_shop ||= Shop.find_by(shopify_domain: shop_domain)
  end

  def shop_domain
    @shop_domain ||= ShopifyAPI::Shop.current.domain
  end
end
