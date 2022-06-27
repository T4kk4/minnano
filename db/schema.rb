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

ActiveRecord::Schema.define(version: 2020_07_05_145156) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role", default: 0, null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "article_contents", force: :cascade do |t|
    t.integer "content_type"
    t.integer "position"
    t.text "body"
    t.boolean "displayed", default: true, null: false
    t.bigint "article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_article_contents_on_article_id"
  end

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.string "thumbnail_url"
    t.text "meta_description"
    t.string "category"
    t.text "table_contents", array: true
    t.string "tags", array: true
    t.text "related_articles", array: true
    t.integer "status", default: 0, null: false
    t.boolean "recommend", default: false, null: false
    t.datetime "released_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "priority", default: 0
    t.bigint "breadcrumb_id"
    t.string "keyword"
    t.index ["breadcrumb_id"], name: "index_articles_on_breadcrumb_id"
  end

  create_table "breadcrumbs", force: :cascade do |t|
    t.string "category_1_url"
    t.string "category_1_name"
    t.string "category_2_url"
    t.string "category_2_name"
    t.string "category_3_url"
    t.string "category_3_name"
    t.string "category_4_url"
    t.string "category_4_name"
    t.string "category_5_url"
    t.string "category_5_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string "area"
    t.string "prefecture"
    t.string "city"
  end

  create_table "contacts", force: :cascade do |t|
    t.integer "user_type", default: 0, null: false
    t.string "user_name"
    t.string "phone_number"
    t.string "mail_address"
    t.string "prefecture"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "city"
  end

  create_table "entries", force: :cascade do |t|
    t.string "tax_account_number"
    t.string "user_name"
    t.string "office_name"
    t.string "location"
    t.string "phone_number"
    t.string "mail_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "images", force: :cascade do |t|
    t.string "file_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "data"
    t.integer "width"
    t.integer "height"
    t.boolean "display_caption", default: false
    t.string "quote"
    t.boolean "display_quote", default: true
    t.string "quote_url"
  end

  create_table "tax_accountants", force: :cascade do |t|
    t.boolean "detailed"
    t.string "office_name"
    t.bigint "city_id"
    t.string "location"
    t.string "access"
    t.string "nearest_station"
    t.integer "belongs_number"
    t.string "representative_name"
    t.string "belongs_council"
    t.string "registration_year"
    t.string "belongs_name"
    t.string "specialty_field", array: true
    t.string "specialty_industry", array: true
    t.string "handling_software", array: true
    t.string "source_url"
    t.integer "priority", default: 0
    t.string "image_url"
    t.boolean "contact", default: false
    t.text "profile"
    t.text "contents"
    t.string "educational_background"
    t.text "achievement"
    t.text "career"
    t.string "license", array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "review", default: 0
    t.string "google_map_location"
    t.text "fee_contents"
    t.text "case_contents"
    t.string "google_map_iframe"
    t.string "google_map_link"
    t.index ["city_id"], name: "index_tax_accountants_on_city_id"
    t.index ["detailed"], name: "index_tax_accountants_on_detailed"
    t.index ["office_name", "location"], name: "index_tax_accountants_on_office_name_and_location", unique: true
  end

  create_table "topic_article_contents", force: :cascade do |t|
    t.integer "content_type"
    t.integer "position"
    t.text "body"
    t.boolean "displayed", default: true, null: false
    t.bigint "topic_article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["topic_article_id"], name: "index_topic_article_contents_on_topic_article_id"
  end

  create_table "topic_articles", force: :cascade do |t|
    t.string "title"
    t.integer "topic_id"
    t.string "thumbnail_url"
    t.text "meta_description"
    t.string "category"
    t.text "table_contents", array: true
    t.string "tags", array: true
    t.text "related_articles", array: true
    t.integer "status", default: 0, null: false
    t.boolean "recommend", default: false, null: false
    t.datetime "released_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "priority", default: 0
    t.bigint "breadcrumb_id"
    t.string "keyword"
    t.index ["breadcrumb_id"], name: "index_topic_articles_on_breadcrumb_id"
  end

end
