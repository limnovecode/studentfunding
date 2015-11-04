class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :slug
      t.string :title
      t.text :description
      t.boolean :active

      t.string :email
      t.string :password_digest
      t.string :authentication_token
      t.string :reset_password_token
      t.datetime :reset_password_sent_at

      t.timestamps null: false
    end
    add_index :stores, :slug, unique: true
    add_index :stores, :email, unique: true
    add_index :stores, :reset_password_token, unique: true
  end
end
