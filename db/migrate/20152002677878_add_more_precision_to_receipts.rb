class AddMorePrecisionToReceipts < ActiveRecord::Migration
  def change
    change_column :receipts, :percentage, :decimal, precision: 12, scale: 2
  end
end
