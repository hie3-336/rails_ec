# frozen_string_literal: true

class Item < ApplicationRecord
  has_one_attached :image

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { only_integer: true }
  validates :number, presence: true
  validates :image, presence: true
end
