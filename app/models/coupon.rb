class Coupon < ApplicationRecord
  belongs_to :cart, optional: true
end
