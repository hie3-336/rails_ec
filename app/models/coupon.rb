# frozen_string_literal: true

class Coupon < ApplicationRecord
  belongs_to :cart, optional: true
end
