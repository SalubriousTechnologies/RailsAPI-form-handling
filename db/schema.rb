# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_07_13_045100) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "centres", force: :cascade do |t|
    t.string "store_code"
    t.string "centre_title"
    t.string "centre_address"
    t.string "centre_type"
    t.decimal "fixed_payment"
    t.decimal "revenue_share"
    t.integer "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "created_by"
    t.index ["store_code"], name: "index_centres_on_store_code"
  end

  create_table "cities", force: :cascade do |t|
    t.bigint "state_id", null: false
    t.string "city_name"
    t.integer "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["state_id"], name: "index_cities_on_state_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "country_iso_code_2"
    t.string "country_iso_code_3"
    t.string "country_name"
    t.integer "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "doctor_categories", force: :cascade do |t|
    t.string "category_code"
    t.string "category_title"
    t.float "fee"
    t.integer "priority"
    t.integer "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "doctors", force: :cascade do |t|
    t.string "name"
    t.date "dob"
    t.integer "fees"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "id_proofs", force: :cascade do |t|
    t.string "id_proof"
    t.integer "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "qualifications", force: :cascade do |t|
    t.string "qualification"
    t.integer "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "revenue_shares", force: :cascade do |t|
    t.bigint "doctor_id", null: false
    t.integer "user_share", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "status"
    t.index ["doctor_id"], name: "index_revenue_shares_on_doctor_id"
  end

  create_table "states", force: :cascade do |t|
    t.bigint "country_id", null: false
    t.string "state_code"
    t.string "state_name"
    t.integer "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["country_id"], name: "index_states_on_country_id"
  end

  create_table "user_id_proofs", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "id_proof_id", null: false
    t.integer "status"
    t.bigint "verified_by"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["id_proof_id"], name: "index_user_id_proofs_on_id_proof_id"
    t.index ["user_id"], name: "index_user_id_proofs_on_user_id"
  end

  create_table "user_qualifications", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "qualification_id", null: false
    t.string "degree"
    t.string "university"
    t.integer "status"
    t.bigint "verified_by"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["qualification_id"], name: "index_user_qualifications_on_qualification_id"
    t.index ["user_id"], name: "index_user_qualifications_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "password_digest"
    t.string "email"
    t.bigint "mobile"
    t.bigint "alternate_contact_no"
    t.string "gender"
    t.date "dob"
    t.string "address"
    t.bigint "city_id"
    t.bigint "state_id"
    t.bigint "country_id"
    t.integer "pincode"
    t.string "default_language"
    t.bigint "doctor_category_id"
    t.float "fee"
    t.string "role"
    t.bigint "centre_id"
    t.string "zoom_id"
    t.string "designation"
    t.string "medical_registration_no"
    t.string "registration_state"
    t.integer "registration_year"
    t.text "work_experience"
    t.text "detailed_experience"
    t.text "awards_n_achievements"
    t.text "summary"
    t.integer "is_internal_doctor"
    t.integer "is_email_confirmed"
    t.integer "is_verified"
    t.integer "is_approved"
    t.integer "is_editable"
    t.integer "is_tnc_accepted"
    t.integer "is_qualified_mso"
    t.integer "status"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.string "auth_token"
    t.datetime "auth_token_expiry"
    t.bigint "created_by"
    t.bigint "approved_by"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["centre_id"], name: "index_users_on_centre_id"
    t.index ["city_id"], name: "index_users_on_city_id"
    t.index ["country_id"], name: "index_users_on_country_id"
    t.index ["doctor_category_id"], name: "index_users_on_doctor_category_id"
    t.index ["state_id"], name: "index_users_on_state_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "cities", "states"
  add_foreign_key "revenue_shares", "doctors"
  add_foreign_key "states", "countries"
  add_foreign_key "user_id_proofs", "id_proofs"
  add_foreign_key "user_id_proofs", "users"
  add_foreign_key "user_qualifications", "qualifications"
  add_foreign_key "user_qualifications", "users"
  add_foreign_key "users", "centres"
  add_foreign_key "users", "cities"
  add_foreign_key "users", "countries"
  add_foreign_key "users", "doctor_categories"
  add_foreign_key "users", "states"
end
