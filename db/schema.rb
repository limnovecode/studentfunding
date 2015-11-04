# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20154551346778) do

  create_table "administrators", force: :cascade do |t|
    t.string   "slug",                   limit: 255
    t.string   "email",                  limit: 255
    t.string   "password_digest",        limit: 255
    t.string   "authentication_token",   limit: 255
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.boolean  "sudo",                               default: false
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
  end

  add_index "administrators", ["email"], name: "index_administrators_on_email", unique: true, using: :btree
  add_index "administrators", ["reset_password_token"], name: "index_administrators_on_reset_password_token", unique: true, using: :btree
  add_index "administrators", ["slug"], name: "index_administrators_on_slug", unique: true, using: :btree

  create_table "legal", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.boolean  "active",                 default: true
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "receipts", force: :cascade do |t|
    t.string   "slug",       limit: 255
    t.integer  "school_id",  limit: 4
    t.integer  "store_id",   limit: 4
    t.integer  "reference",  limit: 4
    t.decimal  "amount",                 precision: 6,  scale: 2
    t.date     "purchased"
    t.string   "status",     limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.decimal  "percentage",             precision: 12, scale: 2
  end

  add_index "receipts", ["school_id"], name: "index_receipts_on_school_id", using: :btree
  add_index "receipts", ["slug"], name: "index_receipts_on_slug", unique: true, using: :btree
  add_index "receipts", ["store_id"], name: "index_receipts_on_store_id", using: :btree

  create_table "schools", force: :cascade do |t|
    t.string   "slug",                   limit: 255
    t.string   "title",                  limit: 255
    t.text     "description",            limit: 65535
    t.boolean  "active"
    t.string   "email",                  limit: 255
    t.string   "password_digest",        limit: 255
    t.string   "authentication_token",   limit: 255
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "schools", ["email"], name: "index_schools_on_email", unique: true, using: :btree
  add_index "schools", ["reset_password_token"], name: "index_schools_on_reset_password_token", unique: true, using: :btree
  add_index "schools", ["slug"], name: "index_schools_on_slug", unique: true, using: :btree

  create_table "stores", force: :cascade do |t|
    t.string   "slug",                   limit: 255
    t.string   "title",                  limit: 255
    t.text     "description",            limit: 65535
    t.boolean  "active"
    t.string   "email",                  limit: 255
    t.string   "password_digest",        limit: 255
    t.string   "authentication_token",   limit: 255
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "created_at",                                                   null: false
    t.datetime "updated_at",                                                   null: false
    t.decimal  "percentage",                           precision: 2, scale: 2
  end

  add_index "stores", ["email"], name: "index_stores_on_email", unique: true, using: :btree
  add_index "stores", ["reset_password_token"], name: "index_stores_on_reset_password_token", unique: true, using: :btree
  add_index "stores", ["slug"], name: "index_stores_on_slug", unique: true, using: :btree

  add_foreign_key "receipts", "schools"
  add_foreign_key "receipts", "stores"
end
