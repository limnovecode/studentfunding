class CreateReceipts < ActiveRecord::Migration
  def change
    create_table :receipts do |t|
      t.string :slug
      t.references :school, index: true, foreign_key: true
      t.references :store, index: true, foreign_key: true
      t.integer :reference
      t.decimal :amount
      t.date :purchased
      t.string :status

      t.timestamps null: false
    end
    add_index :receipts, :slug, unique: true
  end
end
