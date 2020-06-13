# frozen_string_literal: true

class HomeController < AuthenticatedController
  def index
    @orders = NarwhalOrder.where(shop: curr_shop.id)
  end
end
