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

ActiveRecord::Schema.define(:version => 20111024023202) do

  create_table "aas", :force => true do |t|
    t.string   "aa"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "carts", :force => true do |t|
    t.integer  "item_id"
    t.integer  "item_num",         :limit => 10, :precision => 10, :scale => 0
    t.integer  "item_total_price", :limit => 10, :precision => 10, :scale => 0
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "file_uploads", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.string   "file_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", :force => true do |t|
    t.string   "item_no"
    t.string   "item_price"
    t.integer  "item_num"
    t.integer  "item_total_price"
    t.date     "item_date"
    t.string   "item_person"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "order_id"
  end

  create_table "items_orders", :id => false, :force => true do |t|
    t.integer "item_id"
    t.integer "order_id"
  end

  create_table "orders", :force => true do |t|
    t.integer  "all_total"
    t.string   "order_perosn"
    t.date     "order_date"
    t.integer  "order_all_num"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.string   "price"
    t.integer  "num"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rates", :force => true do |t|
    t.integer  "rater_id"
    t.integer  "rateable_id"
    t.string   "rateable_type"
    t.float    "stars",         :null => false
    t.string   "dimension"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rates", ["rateable_id", "rateable_type"], :name => "index_rates_on_rateable_id_and_rateable_type"
  add_index "rates", ["rater_id"], :name => "index_rates_on_rater_id"

  create_table "shedulers", :force => true do |t|
    t.string   "name"
    t.string   "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.integer  "age"
    t.string   "sex"
    t.string   "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "warn_messages", :force => true do |t|
    t.string   "diagnosis"
    t.string   "equipmentNo"
    t.string   "faultDesc"
    t.string   "faultLevel"
    t.string   "orgin_id"
    t.string   "occurTime"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
