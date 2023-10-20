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

ActiveRecord::Schema[7.0].define(version: 2023_10_20_070225) do
  create_table "customers", charset: "utf8mb3", force: :cascade do |t|
    t.string "rfc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "invoice_products", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "invoice_id", null: false
    t.bigint "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["invoice_id"], name: "index_invoice_products_on_invoice_id"
    t.index ["product_id"], name: "index_invoice_products_on_product_id"
  end

  create_table "invoices", charset: "utf8mb3", force: :cascade do |t|
    t.integer "sub_total"
    t.integer "tax"
    t.integer "total"
    t.bigint "customer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_invoices_on_customer_id"
  end

  create_table "products", charset: "utf8mb3", force: :cascade do |t|
    t.integer "quantity"
    t.string "product"
    t.integer "unit_price"
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "customer_id", null: false
    t.index ["customer_id"], name: "index_products_on_customer_id"
  end

  add_foreign_key "invoice_products", "invoices"
  add_foreign_key "invoice_products", "products"
  add_foreign_key "invoices", "customers"
  add_foreign_key "products", "customers"
end
