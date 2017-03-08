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

ActiveRecord::Schema.define(version: 20170308001356) do

  create_table "assignments", force: :cascade do |t|
    t.integer  "start_time"
    t.integer  "end_time"
    t.text     "comments"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "user_id"
    t.integer  "facility_id"
    t.integer  "assignments_week_id"
  end

  add_index "assignments", ["assignments_week_id"], name: "index_assignments_on_assignments_week_id"
  add_index "assignments", ["facility_id"], name: "index_assignments_on_facility_id"
  add_index "assignments", ["user_id"], name: "index_assignments_on_user_id"

  create_table "assignments_weeks", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "facilities", force: :cascade do |t|
    t.string   "name"
    t.integer  "spots"
    t.integer  "su_start"
    t.integer  "su_end"
    t.integer  "m_start"
    t.integer  "m_end"
    t.integer  "tu_start"
    t.integer  "tu_end"
    t.integer  "w_start"
    t.integer  "w_end"
    t.integer  "th_start"
    t.integer  "th_end"
    t.integer  "f_start"
    t.integer  "f_end"
    t.integer  "sa_start"
    t.integer  "sa_end"
    t.text     "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "preference_entries", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "preference_id"
    t.integer  "start_time"
    t.integer  "end_time"
  end

  create_table "preferences", force: :cascade do |t|
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "minimum_hours"
    t.integer  "maximum_hours"
    t.integer  "daily_hours"
    t.boolean  "spread_out"
    t.string   "time_of_week"
    t.string   "time_of_day"
    t.integer  "user_id"
    t.text     "obl1_expl"
    t.text     "obl2_expl"
    t.text     "obl3_expl"
    t.text     "obl4_expl"
  end

  create_table "settings", force: :cascade do |t|
    t.string   "var",                   null: false
    t.text     "value"
    t.integer  "thing_id"
    t.string   "thing_type", limit: 30
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "settings", ["thing_type", "thing_id", "var"], name: "index_settings_on_thing_type_and_thing_id_and_var", unique: true

  create_table "subs", force: :cascade do |t|
    t.text     "comments"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "assignments_week_id"
    t.integer  "assignment_id"
  end

  add_index "subs", ["assignment_id"], name: "index_subs_on_assignment_id"
  add_index "subs", ["assignments_week_id"], name: "index_subs_on_assignments_week_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "name"
    t.boolean  "admin",                  default: false
    t.integer  "preference_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
