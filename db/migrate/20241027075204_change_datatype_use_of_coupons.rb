class ChangeDatatypeUseOfCoupons < ActiveRecord::Migration[7.0]
  def change
    change_column :coupons, :use, 'boolean USING CAST(use AS boolean)'
  end
end
