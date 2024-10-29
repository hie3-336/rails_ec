# frozen_string_literal: true

class CreateCoupons < ActiveRecord::Migration[7.0]
  def change
    create_table :coupons do |t|
      t.references :cart, foreign_key: true
      t.integer :discount, null: false
      t.string :code, null: false
      t.string :use, null: false

      t.timestamps
    end
  end
end
