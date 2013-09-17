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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130917075858) do

  create_table "admin_users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "role"
    t.boolean  "active"
    t.string   "password_digest"
    t.string   "username"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "avatar"
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["name"], :name => "index_admin_users_on_name"
  add_index "admin_users", ["username"], :name => "index_admin_users_on_username", :unique => true

  create_table "airlines", :force => true do |t|
    t.string   "name"
    t.string   "code"
    t.string   "logo"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "airlines", ["code"], :name => "index_airlines_on_code", :unique => true
  add_index "airlines", ["name"], :name => "index_airlines_on_name"

  create_table "bank_accounts", :force => true do |t|
    t.string   "bank_name"
    t.string   "account_number"
    t.string   "account_name"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "cities", :force => true do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "country"
    t.string   "airport_name"
  end

  add_index "cities", ["code"], :name => "index_cities_on_code", :unique => true
  add_index "cities", ["name"], :name => "index_cities_on_name"

  create_table "customers", :force => true do |t|
    t.string   "name"
    t.string   "company"
    t.string   "division"
    t.string   "phone"
    t.string   "email"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.text     "address"
    t.string   "title"
    t.string   "customer_type"
  end

  add_index "customers", ["company"], :name => "index_customers_on_company"
  add_index "customers", ["name"], :name => "index_customers_on_name"

  create_table "paxes", :force => true do |t|
    t.string   "title"
    t.string   "first_name"
    t.string   "ticket_number"
    t.string   "phone"
    t.integer  "transaction_id"
    t.string   "last_name"
    t.string   "id_number"
    t.string   "seat_class"
    t.decimal  "nett_to_agent",  :precision => 10, :scale => 0
    t.decimal  "publish_fare",   :precision => 10, :scale => 0
    t.datetime "created_at",                                    :null => false
    t.datetime "updated_at",                                    :null => false
    t.integer  "departure_id"
    t.integer  "arrival_id"
    t.string   "route"
    t.datetime "departure_date"
    t.datetime "arrival_date"
    t.integer  "airline_id"
  end

  add_index "paxes", ["first_name"], :name => "index_paxes_on_first_name"
  add_index "paxes", ["id_number"], :name => "index_paxes_on_id_number"
  add_index "paxes", ["last_name"], :name => "index_paxes_on_last_name"
  add_index "paxes", ["nett_to_agent"], :name => "index_paxes_on_nett_to_agent"
  add_index "paxes", ["publish_fare"], :name => "index_paxes_on_publish_fare"
  add_index "paxes", ["seat_class"], :name => "index_paxes_on_seat_class"
  add_index "paxes", ["ticket_number"], :name => "index_paxes_on_ticket_number"
  add_index "paxes", ["transaction_id"], :name => "index_paxes_on_transaction_id"

  create_table "transactions", :force => true do |t|
    t.integer  "customer_id"
    t.integer  "departure_id"
    t.integer  "arrival_id"
    t.string   "booking_code"
    t.datetime "time_limit"
    t.date     "issued_date"
    t.integer  "admin_user_id"
    t.decimal  "nett_to_agent",    :precision => 10, :scale => 0
    t.decimal  "publish_fare",     :precision => 10, :scale => 0
    t.integer  "airline_id"
    t.datetime "created_at",                                      :null => false
    t.datetime "updated_at",                                      :null => false
    t.string   "event_name"
    t.string   "route"
    t.string   "flight_code"
    t.decimal  "total_price",      :precision => 10, :scale => 0
    t.string   "transaction_type"
  end

  add_index "transactions", ["admin_user_id"], :name => "index_transactions_on_admin_user_id"
  add_index "transactions", ["airline_id"], :name => "index_transactions_on_airline_id"
  add_index "transactions", ["arrival_id"], :name => "index_transactions_on_arrival_id"
  add_index "transactions", ["booking_code"], :name => "index_transactions_on_booking_code"
  add_index "transactions", ["customer_id"], :name => "index_transactions_on_customer_id"
  add_index "transactions", ["departure_id"], :name => "index_transactions_on_departure_id"
  add_index "transactions", ["event_name"], :name => "index_transactions_on_event_name"
  add_index "transactions", ["issued_date"], :name => "index_transactions_on_issued_date"
  add_index "transactions", ["nett_to_agent"], :name => "index_transactions_on_nett_to_agent"
  add_index "transactions", ["publish_fare"], :name => "index_transactions_on_publish_fare"
  add_index "transactions", ["time_limit"], :name => "index_transactions_on_time_limit"
  add_index "transactions", ["transaction_type"], :name => "index_transactions_on_transaction_type"

end
