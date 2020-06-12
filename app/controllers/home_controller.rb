# frozen_string_literal: true

class HomeController < AuthenticatedController
  def index
    @orders = []
  end
end
