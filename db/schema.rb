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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150623183346) do

  create_table "assets", force: :cascade do |t|
    t.string   "serial"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "cabletypes", force: :cascade do |t|
    t.string   "name"
    t.integer  "conn1_id"
    t.integer  "conn2_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "cabletypes", ["conn1_id"], name: "index_cabletypes_on_conn1_id"
  add_index "cabletypes", ["conn2_id"], name: "index_cabletypes_on_conn2_id"

  create_table "connections", force: :cascade do |t|
    t.integer  "cabletype_id"
    t.integer  "porta_id"
    t.integer  "portb_id"
    t.integer  "inverse_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "connections", ["cabletype_id"], name: "index_connections_on_cabletype_id"
  add_index "connections", ["inverse_id"], name: "index_connections_on_inverse_id"
  add_index "connections", ["porta_id"], name: "index_connections_on_porta_id"
  add_index "connections", ["portb_id"], name: "index_connections_on_portb_id"

  create_table "connectortypes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "devices", force: :cascade do |t|
    t.string   "name"
    t.string   "identifier"
    t.text     "description"
    t.integer  "devicetype_id"
    t.integer  "asset_id"
    t.integer  "location_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "devices", ["asset_id"], name: "index_devices_on_asset_id"
  add_index "devices", ["devicetype_id"], name: "index_devices_on_devicetype_id"
  add_index "devices", ["location_id"], name: "index_devices_on_location_id"

  create_table "devicetypes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "interfaces", force: :cascade do |t|
    t.string   "name"
    t.integer  "port_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "interfaces", ["port_id"], name: "index_interfaces_on_port_id"

  create_table "ipaddresses", force: :cascade do |t|
    t.string   "address"
    t.integer  "parent_id"
    t.integer  "interface_id"
    t.integer  "virtualinterface_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "ipaddresses", ["interface_id"], name: "index_ipaddresses_on_interface_id"
  add_index "ipaddresses", ["parent_id"], name: "index_ipaddresses_on_parent_id"
  add_index "ipaddresses", ["virtualinterface_id"], name: "index_ipaddresses_on_virtualinterface_id"

  create_table "ipranges", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "address"
    t.integer  "prefix"
    t.integer  "parent_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "ipranges", ["parent_id"], name: "index_ipranges_on_parent_id"

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "locations", ["parent_id"], name: "index_locations_on_parent_id"

  create_table "ports", force: :cascade do |t|
    t.string   "name"
    t.integer  "porttype_id"
    t.integer  "device_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "ports", ["device_id"], name: "index_ports_on_device_id"
  add_index "ports", ["porttype_id"], name: "index_ports_on_porttype_id"

  create_table "porttypes", force: :cascade do |t|
    t.string   "name"
    t.integer  "connectortype_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "porttypes", ["connectortype_id"], name: "index_porttypes_on_connectortype_id"

  create_table "vifmembers", force: :cascade do |t|
    t.integer  "virtualinterface_id"
    t.integer  "interface_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "vifmembers", ["interface_id"], name: "index_vifmembers_on_interface_id"
  add_index "vifmembers", ["virtualinterface_id"], name: "index_vifmembers_on_virtualinterface_id"

  create_table "virtualinterfaces", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
