class CreatePurchases < ActiveRecord::Migration[7.0]
  def change
    create_table :purchases do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :user_name, null: false
      t.string :mail, null: false
      t.string :address, null: false
      t.string :apart
      t.string :card_name, null: false
      t.string :card_number, null: false
      t.string :card_expiration, null: false
      t.string :card_cvv, null: false

      t.timestamps
    end
  end
end
