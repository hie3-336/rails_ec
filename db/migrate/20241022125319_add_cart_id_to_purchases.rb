class AddCartIdToPurchases < ActiveRecord::Migration[7.0]
  def change
    add_reference :purchases, :cart, foreign_key: true
  end
end
