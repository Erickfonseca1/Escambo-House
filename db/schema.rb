# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2024_09_25_135549) do
  create_table "exchanges", force: :cascade do |t|
    t.integer "owner_id", null: false
    t.integer "requester_id", null: false
    t.integer "service_offered_id", null: false
    t.integer "service_requested_id", null: false
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.index ["owner_id"], name: "index_exchanges_on_owner_id"
    t.index ["requester_id"], name: "index_exchanges_on_requester_id"
    t.index ["service_offered_id"], name: "index_exchanges_on_service_offered_id"
    t.index ["service_requested_id"], name: "index_exchanges_on_service_requested_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "category"
    t.index ["user_id"], name: "index_services_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin"
    t.string "name"
    t.string "address"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "exchanges", "services", column: "service_offered_id"
  add_foreign_key "exchanges", "services", column: "service_requested_id"
  add_foreign_key "exchanges", "users", column: "owner_id"
  add_foreign_key "exchanges", "users", column: "requester_id"
  add_foreign_key "services", "users"
end
