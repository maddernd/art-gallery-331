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

ActiveRecord::Schema[7.0].define(version: 2023_04_20_014733) do
  create_table "aboriginal_symbols", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "aboriginal_tribe_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["aboriginal_tribe_id"], name: "index_aboriginal_symbols_on_aboriginal_tribe_id"
  end

  create_table "aboriginal_tribes", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "art_types", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "artifacts", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.bigint "artist_id", null: false
    t.bigint "aboriginal_symbol_id", null: false
    t.bigint "art_type_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["aboriginal_symbol_id"], name: "index_artifacts_on_aboriginal_symbol_id"
    t.index ["art_type_id"], name: "index_artifacts_on_art_type_id"
    t.index ["artist_id"], name: "index_artifacts_on_artist_id"
  end

  create_table "artists", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "name"
    t.text "bio"
    t.bigint "aboriginal_tribe_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["aboriginal_tribe_id"], name: "index_artists_on_aboriginal_tribe_id"
  end

  create_table "user_tokens", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "token"
    t.datetime "expires_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["token"], name: "index_user_tokens_on_token"
    t.index ["user_id"], name: "index_user_tokens_on_user_id"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "aboriginal_symbols", "aboriginal_tribes"
  add_foreign_key "artifacts", "aboriginal_symbols"
  add_foreign_key "artifacts", "art_types"
  add_foreign_key "artifacts", "artists"
  add_foreign_key "artists", "aboriginal_tribes"
  add_foreign_key "user_tokens", "users"
end
