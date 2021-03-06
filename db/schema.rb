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

ActiveRecord::Schema.define(version: 20170508041653) do

  create_table "roster_squares", force: :cascade do |t|
    t.integer  "square_id"
    t.integer  "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roster_students", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schools", force: :cascade do |t|
    t.string   "school_icon_name"
    t.string   "school_name"
    t.string   "school_email"
    t.string   "school_website"
    t.text     "school_description"
    t.string   "color"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "session_events", force: :cascade do |t|
    t.integer  "behavior_square_id"
    t.datetime "square_press_time"
    t.datetime "duration_end_time"
    t.integer  "session_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "sessions", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "session_teacher"
    t.integer  "session_student"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "squares", force: :cascade do |t|
    t.string   "square_id"
    t.integer  "square_type"
    t.text     "square_description"
    t.string   "color"
    t.integer  "school_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "students", force: :cascade do |t|
    t.string   "student_icon_name"
    t.string   "student_contact_info"
    t.text     "student_description"
    t.string   "student_icon"
    t.string   "color"
    t.integer  "school_id"
    t.string   "student_name"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "teachers", force: :cascade do |t|
    t.string   "user_name"
    t.string   "teacher_icon_name"
    t.string   "teacher_name"
    t.string   "teacher_email"
    t.boolean  "admin_powers"
    t.boolean  "analysis_powers"
    t.text     "teacher_description"
    t.string   "color"
    t.integer  "school_id"
    t.string   "teacher_password"
    t.string   "teacher_password_confirmation"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "remember_digest"
    t.string   "password_digest"
  end

end
