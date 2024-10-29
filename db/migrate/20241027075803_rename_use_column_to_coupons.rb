# frozen_string_literal: true

class RenameUseColumnToCoupons < ActiveRecord::Migration[7.0]
  def change
    rename_column :coupons, :use, :is_used
  end
end
