# frozen_string_literal: true

class NarwhalOrder < ApplicationRecord
  validates_presence_of :order_id
  validates_presence_of :customer
  validates_presence_of :order_name

  belongs_to :shop
end
