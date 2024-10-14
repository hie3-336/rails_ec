# frozen_string_literal: true

class CreatePurchaseDitails < ActiveRecord::Migration[7.0]
  def change
    create_table :purchase_ditails do |t|
      t.references :purchase, null: false, foreign_key: true
      t.string :name, null: false
      t.integer :price, null: false
      t.integer :count, null: false

      t.timestamps
    end
  end
end
