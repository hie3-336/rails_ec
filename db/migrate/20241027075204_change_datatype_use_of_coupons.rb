# frozen_string_literal: true

class ChangeDatatypeUseOfCoupons < ActiveRecord::Migration[7.0]
  def up
    change_column :coupons, :use, 'boolean USING CAST(use AS boolean)'
  end
end
