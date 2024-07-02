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

ActiveRecord::Schema.define(version: 2024_07_01_161329) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string "commentable_type", null: false
    t.bigint "commentable_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["commentable_type", "commentable_id"], name: "index_comments_on_commentable"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "feedbacks", force: :cascade do |t|
    t.bigint "feedback_by_id", null: false
    t.string "feedbackable_type", null: false
    t.bigint "feedbackable_id", null: false
    t.integer "rating", default: 2
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["feedback_by_id"], name: "index_feedbacks_on_feedback_by_id"
    t.index ["feedbackable_type", "feedbackable_id"], name: "index_feedbacks_on_feedbackable"
  end

  create_table "job_categories", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "job_skills", force: :cascade do |t|
    t.bigint "job_id", null: false
    t.bigint "skill_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["job_id"], name: "index_job_skills_on_job_id"
    t.index ["skill_id"], name: "index_job_skills_on_skill_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.string "title"
    t.bigint "job_category_id", null: false
    t.decimal "hourly_price", precision: 10, scale: 2
    t.decimal "monthly_salary", precision: 10, scale: 2
    t.string "experience"
    t.string "job_type"
    t.text "description"
    t.bigint "uploader_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["job_category_id"], name: "index_jobs_on_job_category_id"
    t.index ["uploader_id"], name: "index_jobs_on_uploader_id"
  end

  create_table "likes", force: :cascade do |t|
    t.string "likeable_type", null: false
    t.bigint "likeable_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["likeable_type", "likeable_id"], name: "index_likes_on_likeable"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "project_skills", force: :cascade do |t|
    t.bigint "project_id", null: false
    t.bigint "skill_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_id"], name: "index_project_skills_on_project_id"
    t.index ["skill_id"], name: "index_project_skills_on_skill_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "title"
    t.bigint "category_id", null: false
    t.decimal "min_per_hour_price", precision: 10, scale: 2
    t.decimal "max_per_hour_price", precision: 10, scale: 2
    t.decimal "min_total_price", precision: 10, scale: 2
    t.decimal "max_total_price", precision: 10, scale: 2
    t.text "description"
    t.integer "likes_count", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "uploader_id"
    t.index ["category_id"], name: "index_projects_on_category_id"
    t.index ["uploader_id"], name: "index_projects_on_uploader_id"
  end

  create_table "saved_items", force: :cascade do |t|
    t.string "item_type", null: false
    t.bigint "item_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_type", "item_id", "user_id"], name: "index_saved_items_on_item_type_and_item_id_and_user_id"
    t.index ["item_type", "item_id"], name: "index_saved_items_on_item"
    t.index ["user_id"], name: "index_saved_items_on_user_id"
  end

  create_table "skills", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "timezone", null: false
    t.string "country", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "provider"
    t.string "uid"
    t.string "profession"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "views", force: :cascade do |t|
    t.string "viewable_type", null: false
    t.bigint "viewable_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_views_on_user_id"
    t.index ["viewable_type", "viewable_id"], name: "index_views_on_viewable"
  end

  add_foreign_key "comments", "users"
  add_foreign_key "feedbacks", "users", column: "feedback_by_id"
  add_foreign_key "job_skills", "jobs"
  add_foreign_key "job_skills", "skills"
  add_foreign_key "jobs", "job_categories"
  add_foreign_key "jobs", "users", column: "uploader_id"
  add_foreign_key "likes", "users"
  add_foreign_key "project_skills", "projects"
  add_foreign_key "project_skills", "skills"
  add_foreign_key "projects", "categories"
  add_foreign_key "projects", "users", column: "uploader_id"
  add_foreign_key "saved_items", "users"
  add_foreign_key "views", "users"
end
