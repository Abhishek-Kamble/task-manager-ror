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

ActiveRecord::Schema[7.1].define(version: 2024_03_31_112315) do
  create_table "departments", charset: "utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tasks", charset: "utf8mb4", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.date "due_date"
    t.integer "status"
    t.integer "priority"
    t.bigint "assignee_id"
    t.bigint "user_id"
    t.bigint "verifier_id"
    t.bigint "creator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "department_id", null: false
    t.index ["assignee_id"], name: "index_tasks_on_assignee_id"
    t.index ["creator_id"], name: "index_tasks_on_creator_id"
    t.index ["department_id"], name: "index_tasks_on_department_id"
    t.index ["user_id"], name: "index_tasks_on_user_id"
    t.index ["verifier_id"], name: "index_tasks_on_verifier_id"
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.date "date_of_birth", null: false
    t.string "country"
    t.string "email", null: false
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "department_id", null: false
    t.index ["department_id"], name: "index_users_on_department_id"
  end

  add_foreign_key "tasks", "departments"
  add_foreign_key "tasks", "users"
  add_foreign_key "tasks", "users", column: "assignee_id"
  add_foreign_key "tasks", "users", column: "creator_id"
  add_foreign_key "tasks", "users", column: "verifier_id"
  add_foreign_key "users", "departments"
end
