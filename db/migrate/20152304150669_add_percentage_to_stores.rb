class AddPercentageToStores < ActiveRecord::Migration
  def change
    add_column :stores, :percentage, :decimal, precision: 2, scale: 2
  end
end
