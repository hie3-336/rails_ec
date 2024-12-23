# frozen_string_literal: true

class Purchase < ApplicationRecord
  has_many :purchase_ditails, dependent: :nullify
  belongs_to :cart
  has_one :coupon, through: :cart

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :user_name, presence: true
  validates :mail, presence: true
  validates :address, presence: true
  validates :card_name, presence: true
  validates :card_number, presence: true
  validates :card_expiration, presence: true
  validates :card_cvv, presence: true
end
