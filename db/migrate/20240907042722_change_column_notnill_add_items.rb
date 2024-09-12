# frozen_string_literal: true

class ChangeColumnNotnillAddItems < ActiveRecord::Migration[7.0]
  def chenge
    chenge_table :items, bulk: true do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.integer :price, null: false
      t.string :number, null: false
    end
  end
end
