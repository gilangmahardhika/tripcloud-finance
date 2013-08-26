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

ActiveRecord::Schema.define(:version => 20130826090031) do

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

  create_table "cities", :force => true do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "cities", ["code"], :name => "index_cities_on_code", :unique => true
  add_index "cities", ["name"], :name => "index_cities_on_name"

  create_table "customers", :force => true do |t|
    t.string   "name"
    t.string   "company"
    t.string   "division"
    t.string   "phone"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "customers", ["company"], :name => "index_customers_on_company"
  add_index "customers", ["name"], :name => "index_customers_on_name"

end
