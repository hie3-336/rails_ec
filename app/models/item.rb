# frozen_string_literal: true

class Item < ApplicationRecord
  has_one_attached :image

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :number, presence: true
  validates :image, presence: true
end
