ActiveRecord::Schema.define(version: 20150117102703) do

  enable_extension "plpgsql"

  create_table "profiles", force: true do |t|
    t.string   "email"
    t.text     "data"
    t.boolean  "is_influential", default: false
    t.string   "score"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "registers", force: true do |t|
    t.boolean  "is_influential"
    t.boolean  "is_notified"
    t.integer  "website_id"
    t.integer  "profile_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "websites", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "host"
    t.uuid     "secret_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "websites", ["secret_token"], name: "index_websites_on_secret_token", unique: true, using: :btree

end