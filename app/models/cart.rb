# frozen_string_literal: true

class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy
end
