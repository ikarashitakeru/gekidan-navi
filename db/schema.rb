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

ActiveRecord::Schema[8.0].define(version: 2026_08_21_091542) do
  create_table "applications", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "recruitment_id"
    t.text "motivation"
    t.integer "selection_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recruitment_id"], name: "index_applications_on_recruitment_id"
    t.index ["user_id"], name: "index_applications_on_user_id"
  end

  create_table "recruitments", force: :cascade do |t|
    t.bigint "theater_id"
    t.string "title"
    t.text "description"
    t.integer "capacity"
    t.date "deadline"
    t.string "activity_area"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["theater_id"], name: "index_recruitments_on_theater_id"
  end

  create_table "theaters", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "encrypted_password", null: false
    t.text "introduction"
    t.string "activity_area", null: false
    t.string "website_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_theaters_on_email", unique: true
    t.index ["reset_password_token"], name: "index_theaters_on_reset_password_token", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name", null: false
    t.text "introduction"
    t.text "acting_experience"
    t.text "singing_experience"
    t.text "dance_experience"
    t.string "preferred_area"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "applications", "recruitments"
  add_foreign_key "applications", "users"
  add_foreign_key "recruitments", "theaters"
end
