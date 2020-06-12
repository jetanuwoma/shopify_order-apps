ShopifyApp.configure do |config|
  config.application_name = 'My Shopify App'
  config.api_key = ENV['SHOPIFY_API_KEY']
  config.secret = ENV['SHOPIFY_API_SECRET']
  config.old_secret = ''
  config.scope = 'read_products, read_orders'
  config.embedded_app = true
  config.after_authenticate_job = false
  config.api_version = '2020-04'
  config.session_repository = Shop
  url = "#{ENV['SHOPIFY_APP_HOST']}/webhooks"
  config.webhooks = [
    {
      topic: 'orders/create',
      address: "#{url}/orders_create",
      format: 'json'
    },
    {
      topic: 'orders/paid',
      address: "#{url}/orders_paid",
      format: 'json'
    }
  ]
end
