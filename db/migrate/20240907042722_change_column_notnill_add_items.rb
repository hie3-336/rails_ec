class ChangeColumnNotnillAddItems < ActiveRecord::Migration[7.0]
  def change
    change_column :items, :name, :string, null: false
    change_column :items, :description, :string, null: false
    change_column :items, :price, :integer, null: false
    change_column :items, :number, :string, null: false
  end
end
