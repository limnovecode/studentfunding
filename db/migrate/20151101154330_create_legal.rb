class CreateLegal < ActiveRecord::Migration
  def change
    create_table :legal do |t|
      t.string :title
      t.boolean :active, default: true

      t.timestamps null: false
    end
  end
end
