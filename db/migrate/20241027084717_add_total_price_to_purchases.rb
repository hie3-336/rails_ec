class AddTotalPriceToPurchases < ActiveRecord::Migration[7.0]
  def change
    add_column :purchases, :total_price, :integer, null: false, default: 0
  end
end
