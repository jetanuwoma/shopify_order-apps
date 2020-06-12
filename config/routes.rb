# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'
  mount ShopifyApp::Engine, at: '/'

  match 'webhooks/orders_create', via: :post, to: 'orders#orders_create'
  match 'webhooks/orders_paid', via: :post, to: 'orders#orders_paid'
end
