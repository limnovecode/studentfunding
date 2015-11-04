class AddDetailsToReceipts < ActiveRecord::Migration
  def change
    change_column :receipts, :amount, :decimal, precision: 6, scale: 2
  end
end
