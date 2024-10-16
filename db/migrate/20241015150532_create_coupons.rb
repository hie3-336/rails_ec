class CreateCoupons < ActiveRecord::Migration[7.0]
  def change
    create_table :coupons do |t|
      t.references :cart, foreign_key: true
      t.integer :discount, null: false
      t.string :code, null: false
      t.boolean :use, null: false

      t.timestamps
    end
  end
end
