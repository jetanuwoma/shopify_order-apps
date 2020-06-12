# frozen_string_literal: true

# OrderController - manage when orders are created and paid for
class OrdersController < ApplicationController
  include ::ShopifyApp::WebhookVerification

  def orders_create
    OrdersCreateJob.perform_async(shop_domain, webhook_payload)
    head :no_content
  end

  def orders_paid
    OrdersPaidJob.perform_async(shop_domain, webhook_payload)
    head :no_content
  end

  private

  def webhook_payload
    webh_params = webhook_params.to_h
    {
      id: webh_params[:id],
      customer: webh_params[:customer],
      line_items: webh_params[:line_items],
      order_number: webh_params[:order_number],
    }.to_json
  end

  def shop_domain
    @shop_domain ||= ShopifyAPI::Shop.current.domain
  end

  def webhook_params
    params.try(:permit!)
    @webhook_params ||= params.except(:controller, :action, :type)
  end
end
