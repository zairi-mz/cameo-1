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

ActiveRecord::Schema.define(:version => 20120122102619) do

  create_table "addresses", :force => true do |t|
    t.string   "company"
    t.string   "web"
    t.text     "address"
    t.string   "fax"
    t.string   "phone"
    t.string   "email"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "components", :force => true do |t|
    t.string   "component_code"
    t.integer  "parent_id"
    t.string   "name"
    t.integer  "location_id"
    t.string   "type_no"
    t.string   "serial_no"
    t.date     "installed_on"
    t.integer  "manufacturer_id"
    t.integer  "supplier_id"
    t.text     "tech_description"
    t.integer  "counter_id"
    t.integer  "unit_id"
    t.integer  "created_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ancestry"
  end

  add_index "components", ["ancestry"], :name => "index_components_on_ancestry"

  create_table "compparts", :force => true do |t|
    t.integer  "component_id"
    t.integer  "part_id"
    t.integer  "quantity"
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "documents", :force => true do |t|
    t.string   "doc_code"
    t.string   "title"
    t.string   "publisher"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
  end

  create_table "jobdescs", :force => true do |t|
    t.integer  "job_code"
    t.string   "description"
    t.text     "method"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", :force => true do |t|
    t.string   "code"
    t.string   "name"
    t.string   "orgchart_id"
    t.string   "ancestry"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "maintenances", :force => true do |t|
    t.string   "code"
    t.integer  "component_id"
    t.string   "description"
    t.integer  "frequency"
    t.integer  "frequency_unit"
    t.integer  "level"
    t.integer  "action_group_id"
    t.date     "first_date"
    t.date     "next_date"
    t.integer  "priority"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "Jobdesc_id"
  end

  create_table "maintgroups", :force => true do |t|
    t.string   "short_name"
    t.string   "name"
    t.integer  "quantity"
    t.decimal  "rate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mainthours", :force => true do |t|
    t.integer  "maintenance_id"
    t.integer  "maintgroup_id"
    t.decimal  "hours"
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "maintparts", :force => true do |t|
    t.integer  "maintenance_id"
    t.integer  "part_id"
    t.integer  "quantity"
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mainttools", :force => true do |t|
    t.integer  "maintenance_id"
    t.integer  "tool_id"
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orgcharts", :force => true do |t|
    t.string   "code"
    t.string   "name"
    t.string   "ancestry"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "parts", :force => true do |t|
    t.string   "part_code"
    t.string   "name"
    t.string   "part_no"
    t.integer  "supplier_id"
    t.integer  "manufacturer_id"
    t.decimal  "price"
    t.integer  "location_id"
    t.text     "notes"
    t.integer  "tool_class"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "authname"
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  create_table "tools", :force => true do |t|
    t.string   "tool_code"
    t.string   "name"
    t.string   "tool_no"
    t.integer  "supplier_id"
    t.integer  "manufacturer_id"
    t.decimal  "price"
    t.integer  "location_id"
    t.text     "notes"
    t.integer  "tool_class"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login",                     :limit => 40
    t.string   "name",                      :limit => 100, :default => ""
    t.string   "email",                     :limit => 100
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true

end
