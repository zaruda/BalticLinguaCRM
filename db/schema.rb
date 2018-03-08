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

ActiveRecord::Schema.define(version: 2018_03_07_210856) do

  create_table "active_admin_comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
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

  create_table "active_storage_attachments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "admin_users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
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
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "contractor_contacts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "phone"
    t.string "email"
    t.bigint "contractor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contractor_id"], name: "index_contractor_contacts_on_contractor_id"
  end

  create_table "contractor_services", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "language_from"
    t.string "language_to"
    t.bigint "contractor_id"
    t.bigint "service_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contractor_id"], name: "index_contractor_services_on_contractor_id"
    t.index ["service_id"], name: "index_contractor_services_on_service_id"
  end

  create_table "contractor_tasks", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "status"
    t.string "tarif"
    t.string "scope_of_work"
    t.text "description"
    t.bigint "contractor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contractor_id"], name: "index_contractor_tasks_on_contractor_id"
  end

  create_table "contractors", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "department"
    t.date "birthday"
    t.string "invoices_from"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contractors_orders", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "order_id"
    t.bigint "contractor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contractor_id"], name: "index_contractors_orders_on_contractor_id"
    t.index ["order_id"], name: "index_contractors_orders_on_order_id"
  end

  create_table "customer_contacts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "region"
    t.string "address"
    t.string "phone"
    t.string "fax"
    t.string "email"
    t.string "website"
    t.bigint "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_customer_contacts_on_customer_id"
  end

  create_table "customer_requisites", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "value"
    t.bigint "customer_id"
    t.bigint "requisite_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_customer_requisites_on_customer_id"
    t.index ["requisite_id"], name: "index_customer_requisites_on_requisite_id"
  end

  create_table "customers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "unp_ogrn"
    t.string "scope"
    t.string "category"
    t.string "type"
    t.string "status"
    t.text "comment"
    t.string "bill_type"
    t.boolean "is_bill_attachment"
    t.string "application_type"
    t.string "invoice_from"
    t.string "payment_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "editor_tasks", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "status"
    t.string "tarif"
    t.text "description"
    t.bigint "admin_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_user_id"], name: "index_editor_tasks_on_admin_user_id"
  end

  create_table "orders", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "status"
    t.string "payment_status"
    t.datetime "start_date_contractor"
    t.datetime "end_date_contractor"
    t.datetime "start_date_customer"
    t.datetime "end_date_customer"
    t.integer "priority"
    t.text "description"
    t.string "scope_of_work"
    t.string "price"
    t.bigint "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_orders_on_customer_id"
  end

  create_table "payments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "amount"
    t.string "status"
    t.bigint "order_id"
    t.bigint "contractor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contractor_id"], name: "index_payments_on_contractor_id"
    t.index ["order_id"], name: "index_payments_on_order_id"
  end

  create_table "requisites", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "services", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "contractor_contacts", "contractors"
  add_foreign_key "contractor_services", "contractors"
  add_foreign_key "contractor_services", "services"
  add_foreign_key "contractor_tasks", "contractors"
  add_foreign_key "contractors_orders", "contractors"
  add_foreign_key "contractors_orders", "orders"
  add_foreign_key "customer_contacts", "customers"
  add_foreign_key "customer_requisites", "customers"
  add_foreign_key "customer_requisites", "requisites"
  add_foreign_key "editor_tasks", "admin_users"
  add_foreign_key "orders", "customers"
  add_foreign_key "payments", "contractors"
  add_foreign_key "payments", "orders"
end
