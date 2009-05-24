# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090524035704) do

  create_table "cdrs", :force => true do |t|
    t.datetime "calldate"
    t.string   "src"
    t.string   "dst"
    t.string   "channel"
    t.string   "dstchannel"
    t.string   "didnumber"
    t.integer  "duration"
    t.integer  "billsec"
    t.string   "disposition"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pinless_numbers", :force => true do |t|
    t.string   "ani_or_phonenumber"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "plans", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "minutes"
    t.decimal  "price",       :precision => 10, :scale => 2
    t.integer  "phones"
    t.boolean  "recursive"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "speeddial_numbers", :force => true do |t|
    t.string   "number"
    t.string   "description"
    t.integer  "entry"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login",               :default => "", :null => false
    t.string   "email",               :default => "", :null => false
    t.string   "crypted_password",    :default => "", :null => false
    t.string   "password_salt",       :default => "", :null => false
    t.string   "single_access_token", :default => "", :null => false
    t.string   "persistence_token",   :default => "", :null => false
    t.string   "perishable_token",    :default => "", :null => false
    t.integer  "login_count",         :default => 0,  :null => false
    t.integer  "failed_login_count",  :default => 0,  :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.string   "first_name",          :default => "", :null => false
    t.string   "last_name",           :default => "", :null => false
    t.string   "address_1",           :default => "", :null => false
    t.string   "address_2",           :default => "", :null => false
    t.string   "city",                :default => "", :null => false
    t.string   "state",               :default => "", :null => false
    t.string   "zip_code",            :default => "", :null => false
    t.string   "phone_number",        :default => "", :null => false
    t.integer  "plan_id",                             :null => false
    t.date     "card_expires_on",                     :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
