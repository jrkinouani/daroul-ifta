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

ActiveRecord::Schema.define(version: 20190730080106) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.boolean "notification", default: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "answers", force: :cascade do |t|
    t.string "content"
    t.integer "question_id"
    t.integer "admin_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "nb_validation", default: 0
    t.integer "writer_id"
    t.index ["admin_id"], name: "index_answers_on_admin_id"
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
  end

  create_table "category_questions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "category_id"
    t.integer "question_id"
  end

  create_table "hadiths", force: :cascade do |t|
    t.string "hadith"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "information", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "keywords", force: :cascade do |t|
    t.integer "subcategory_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subcategory_id"], name: "index_keywords_on_subcategory_id"
  end

  create_table "nisabs", force: :cascade do |t|
    t.string "title"
    t.string "mois"
    t.integer "price_or"
    t.integer "price_silver"
    t.integer "zakat_fatimi"
    t.integer "zakat_fidiyah"
    t.integer "nisab_zakat"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "nissabs", force: :cascade do |t|
    t.string "mois"
    t.integer "an"
    t.integer "prix_or"
    t.integer "prix_argent"
    t.integer "mahr_minimum"
    t.integer "mahr_fatimi"
    t.integer "fidyah"
    t.integer "nissab_zakate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "nissabzakates", force: :cascade do |t|
    t.string "mois"
    t.integer "an"
    t.float "prix_or"
    t.float "prix_argent"
    t.float "mahr_minimum"
    t.float "mahr_fatimi"
    t.float "fidyah"
    t.float "nissab_zakate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "nissabzakats", force: :cascade do |t|
    t.string "mois"
    t.integer "an"
    t.float "prix_or"
    t.float "prix_argent"
    t.float "mahr_minimum"
    t.float "mahr_fatimi"
    t.float "fidyah"
    t.float "nissab_zakate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "question_keywords", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "keyword_id"
    t.integer "question_id"
  end

  create_table "question_subcategories", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "subcategory_id"
    t.integer "question_id"
  end

  create_table "questions", force: :cascade do |t|
    t.text "content"
    t.integer "category_id"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "view_count", default: 0
    t.index ["category_id"], name: "index_questions_on_category_id"
  end

  create_table "subcategories", force: :cascade do |t|
    t.integer "category_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_subcategories_on_category_id"
  end

  create_table "validations", force: :cascade do |t|
    t.integer "answer_id"
    t.integer "admin_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_id"], name: "index_validations_on_admin_id"
    t.index ["answer_id"], name: "index_validations_on_answer_id"
  end

  create_table "writers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.boolean "notification", default: false
    t.index ["email"], name: "index_writers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_writers_on_reset_password_token", unique: true
  end

  create_table "zakatnissabs", force: :cascade do |t|
    t.string "mois"
    t.integer "an"
    t.decimal "prix_or"
    t.decimal "prix_argent"
    t.decimal "mahr_minimum"
    t.decimal "mahr_fatimi"
    t.decimal "fidyah"
    t.decimal "nissab_zakate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "moisfrancais"
    t.integer "anneefr"
  end

end
