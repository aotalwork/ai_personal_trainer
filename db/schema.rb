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

ActiveRecord::Schema[8.1].define(version: 2026_09_10_132438) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "allergies", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "calendar_events", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "ends_at"
    t.string "google_event_id"
    t.datetime "starts_at"
    t.datetime "synced_at"
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.bigint "workout_id", null: false
    t.index ["user_id"], name: "index_calendar_events_on_user_id"
    t.index ["workout_id"], name: "index_calendar_events_on_workout_id"
  end

  create_table "equipment", force: :cascade do |t|
    t.string "category"
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "exercise_equipments", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "equipment_id", null: false
    t.bigint "exercise_id", null: false
    t.datetime "updated_at", null: false
    t.index ["equipment_id"], name: "index_exercise_equipments_on_equipment_id"
    t.index ["exercise_id"], name: "index_exercise_equipments_on_exercise_id"
  end

  create_table "exercises", force: :cascade do |t|
    t.text "contraindications"
    t.datetime "created_at", null: false
    t.text "description"
    t.string "difficulty"
    t.text "instructions"
    t.string "movement_pattern"
    t.string "muscle_group"
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "exports", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "export_type"
    t.string "file_path"
    t.bigint "plan_id", null: false
    t.string "status"
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["plan_id"], name: "index_exports_on_plan_id"
    t.index ["user_id"], name: "index_exports_on_user_id"
  end

  create_table "foods", force: :cascade do |t|
    t.decimal "calories"
    t.decimal "carbohydrates_grams"
    t.datetime "created_at", null: false
    t.decimal "fat_grams"
    t.decimal "fiber_grams"
    t.boolean "gluten_free"
    t.boolean "lactose_free"
    t.string "name"
    t.decimal "protein_grams"
    t.datetime "updated_at", null: false
    t.boolean "vegan"
    t.boolean "vegetarian"
  end

  create_table "gym_equipments", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "equipment_id", null: false
    t.bigint "gym_id", null: false
    t.datetime "updated_at", null: false
    t.index ["equipment_id"], name: "index_gym_equipments_on_equipment_id"
    t.index ["gym_id"], name: "index_gym_equipments_on_gym_id"
  end

  create_table "gyms", force: :cascade do |t|
    t.string "address"
    t.string "city"
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_gyms_on_user_id"
  end

  create_table "health_profiles", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "emergency_contact_name"
    t.string "emergency_contact_phone"
    t.boolean "has_current_pain"
    t.boolean "has_injury"
    t.text "injuries"
    t.text "medical_conditions"
    t.text "medications"
    t.text "pain_description"
    t.text "physical_limitations"
    t.text "professional_restrictions"
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_health_profiles_on_user_id"
  end

  create_table "intolerances", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "meal_items", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "food_id", null: false
    t.bigint "meal_id", null: false
    t.decimal "quantity_grams"
    t.datetime "updated_at", null: false
    t.index ["food_id"], name: "index_meal_items_on_food_id"
    t.index ["meal_id"], name: "index_meal_items_on_meal_id"
  end

  create_table "meal_plans", force: :cascade do |t|
    t.decimal "calories"
    t.decimal "carbohydrates_grams"
    t.datetime "created_at", null: false
    t.decimal "fat_grams"
    t.bigint "plan_id", null: false
    t.decimal "protein_grams"
    t.datetime "updated_at", null: false
    t.index ["plan_id"], name: "index_meal_plans_on_plan_id"
  end

  create_table "meals", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "meal_plan_id", null: false
    t.string "meal_type"
    t.string "name"
    t.text "notes"
    t.time "scheduled_time"
    t.datetime "updated_at", null: false
    t.index ["meal_plan_id"], name: "index_meals_on_meal_plan_id"
  end

  create_table "plans", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "duration_weeks"
    t.datetime "generated_at"
    t.string "goal"
    t.string "name"
    t.string "status"
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_plans_on_user_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "activity_level"
    t.text "available_days"
    t.date "birth_date"
    t.string "budget_level"
    t.datetime "created_at", null: false
    t.string "diet_type"
    t.text "disliked_foods"
    t.string "first_name"
    t.text "food_preferences"
    t.string "goal"
    t.decimal "height_cm"
    t.string "last_name"
    t.string "location"
    t.integer "meals_per_day"
    t.string "preferred_training_time"
    t.string "sex"
    t.integer "training_days_per_week"
    t.string "training_experience"
    t.string "training_location"
    t.integer "training_minutes_per_session"
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.decimal "weight_kg"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "progress_measurements", force: :cascade do |t|
    t.integer "adherence_percentage"
    t.decimal "body_fat_percentage"
    t.datetime "created_at", null: false
    t.integer "energy_level"
    t.date "measured_at"
    t.text "notes"
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.decimal "waist_cm"
    t.decimal "weight_kg"
    t.index ["user_id"], name: "index_progress_measurements_on_user_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "ip_address"
    t.datetime "updated_at", null: false
    t.string "user_agent"
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "user_allergies", force: :cascade do |t|
    t.bigint "allergy_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["allergy_id"], name: "index_user_allergies_on_allergy_id"
    t.index ["user_id"], name: "index_user_allergies_on_user_id"
  end

  create_table "user_intolerances", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "intolerance_id", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["intolerance_id"], name: "index_user_intolerances_on_intolerance_id"
    t.index ["user_id"], name: "index_user_intolerances_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email_address", null: false
    t.string "password_digest", null: false
    t.datetime "updated_at", null: false
    t.index ["email_address"], name: "index_users_on_email_address", unique: true
  end

  create_table "workout_exercises", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "exercise_id", null: false
    t.integer "position"
    t.string "reps"
    t.integer "rest_seconds"
    t.integer "rir"
    t.integer "sets"
    t.string "tempo"
    t.datetime "updated_at", null: false
    t.decimal "weight"
    t.bigint "workout_id", null: false
    t.index ["exercise_id"], name: "index_workout_exercises_on_exercise_id"
    t.index ["workout_id"], name: "index_workout_exercises_on_workout_id"
  end

  create_table "workouts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "duration_minutes"
    t.string "focus"
    t.string "name"
    t.text "notes"
    t.bigint "plan_id", null: false
    t.date "scheduled_date"
    t.datetime "updated_at", null: false
    t.index ["plan_id"], name: "index_workouts_on_plan_id"
  end

  add_foreign_key "calendar_events", "users"
  add_foreign_key "calendar_events", "workouts"
  add_foreign_key "exercise_equipments", "equipment"
  add_foreign_key "exercise_equipments", "exercises"
  add_foreign_key "exports", "plans"
  add_foreign_key "exports", "users"
  add_foreign_key "gym_equipments", "equipment"
  add_foreign_key "gym_equipments", "gyms"
  add_foreign_key "gyms", "users"
  add_foreign_key "health_profiles", "users"
  add_foreign_key "meal_items", "foods"
  add_foreign_key "meal_items", "meals"
  add_foreign_key "meal_plans", "plans"
  add_foreign_key "meals", "meal_plans"
  add_foreign_key "plans", "users"
  add_foreign_key "profiles", "users"
  add_foreign_key "progress_measurements", "users"
  add_foreign_key "sessions", "users"
  add_foreign_key "user_allergies", "allergies"
  add_foreign_key "user_allergies", "users"
  add_foreign_key "user_intolerances", "intolerances"
  add_foreign_key "user_intolerances", "users"
  add_foreign_key "workout_exercises", "exercises"
  add_foreign_key "workout_exercises", "workouts"
  add_foreign_key "workouts", "plans"
end
