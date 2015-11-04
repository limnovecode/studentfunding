class AddPercentageToReceipts < ActiveRecord::Migration
  def change
    add_column :receipts, :percentage, :decimal, precision: 2, scale: 2
  end
end
