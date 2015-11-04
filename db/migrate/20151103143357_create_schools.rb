class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
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
    add_index :schools, :slug, unique: true
    add_index :schools, :email, unique: true
    add_index :schools, :reset_password_token, unique: true
  end
end
