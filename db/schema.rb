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

ActiveRecord::Schema.define(version: 20190129135234) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "applicants", force: :cascade do |t|
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.integer  "grade"
    t.string   "gender"
    t.string   "parent_first_name"
    t.string   "parent_last_name"
    t.string   "address"
    t.string   "home_phone"
    t.string   "work_phone"
    t.string   "email"
    t.string   "math_teacher"
    t.string   "science_teacher"
    t.string   "english_teacher"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "school_phone"
    t.string   "counselor_name"
    t.string   "due_to"
    t.date     "date_due"
    t.integer  "school_id"
    t.string   "math_teacher_email"
    t.string   "science_teacher_email"
    t.string   "english_teacher_email"
    t.boolean  "applicant_confirmation"
    t.boolean  "parent_confirmation"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.float    "gpa"
    t.string   "applicant_email"
    t.boolean  "teacher_contacted"
    t.boolean  "is_archived",                     default: false
    t.string   "ethnicity"
    t.boolean  "student_texts_ok",                default: false
    t.boolean  "parent_texts_ok",                 default: false
    t.string   "after_graduation_plans"
    t.string   "degree_plans"
    t.string   "track"
    t.string   "additional_academic_information"
    t.string   "extra_curricular_activities"
    t.text     "additional_academic_info"
    t.text     "engineering_essay"
    t.text     "interests_essay"
    t.integer  "psat_english"
    t.integer  "psat_math"
    t.string   "vpt_english"
    t.string   "vpt_math"
    t.integer  "essay1_score"
    t.integer  "essay2_score"
  end

  add_index "applicants", ["last_name", "first_name", "address", "email"], name: "applicant_index", unique: true, using: :btree

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0
    t.integer  "attempts",   default: 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "schools", force: :cascade do |t|
    t.string   "name"
    t.string   "representative_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_designation_id"
  end

  create_table "teacher_recommendations", force: :cascade do |t|
    t.integer  "desire"
    t.integer  "aptitude"
    t.integer  "persistence"
    t.integer  "self_discipline"
    t.integer  "interaction"
    t.integer  "problem_solving"
    t.integer  "inquiry_skills"
    t.integer  "study_skills"
    t.integer  "time_management"
    t.integer  "teamwork"
    t.integer  "dedication"
    t.integer  "work_ethic"
    t.integer  "recommendation"
    t.string   "subject"
    t.date     "date_submitted"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "applicant_id"
    t.string   "email"
    t.string   "teacher_name"
    t.string   "slug"
    t.datetime "last_notified_at"
    t.integer  "self_starter",     default: 0
    t.integer  "written_work",     default: 0
  end

  add_index "teacher_recommendations", ["slug"], name: "index_teacher_recommendations_on_slug", unique: true, using: :btree

  create_table "user_designations", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "school_id"
    t.integer  "user_id"
    t.string   "description"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                  default: false
    t.string   "name"
    t.integer  "user_designation_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
