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

ActiveRecord::Schema.define(version: 20170510014050) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string   "name"
    t.integer  "organization_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["organization_id"], name: "index_accounts_on_organization_id", using: :btree
  end

  create_table "connection_accounts", force: :cascade do |t|
    t.integer  "account_id"
    t.string   "type"
    t.string   "id_str"
    t.text     "access_token"
    t.text     "access_token_secret"
    t.datetime "disconnected_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "latest_post_id"
    t.string   "name"
    t.string   "handle"
    t.integer  "followers_count"
    t.text     "description"
    t.string   "avatar_url"
    t.jsonb    "blacklisted_words_list", default: []
    t.index ["account_id"], name: "index_connection_accounts_on_account_id", using: :btree
  end

  create_table "organizations", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_organizations_on_user_id", using: :btree
  end

  create_table "posts", force: :cascade do |t|
    t.string   "id_str"
    t.string   "type"
    t.string   "post_type"
    t.string   "screen_name"
    t.integer  "connection_account_id"
    t.text     "post_text"
    t.jsonb    "blacklisted_words",     default: []
    t.date     "post_created_at_date"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.string   "phone_number"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "accounts", "organizations"
  add_foreign_key "connection_accounts", "accounts"
  add_foreign_key "organizations", "users"
end
