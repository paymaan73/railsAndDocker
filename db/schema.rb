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

ActiveRecord::Schema[7.0].define(version: 2023_08_08_080250) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_roles", force: :cascade do |t|
    t.bigint "action_id"
    t.bigint "role_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["action_id"], name: "index_action_roles_on_action_id"
    t.index ["role_id"], name: "index_action_roles_on_role_id"
  end

  create_table "actions", force: :cascade do |t|
    t.string "name"
    t.string "controller_class"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "address_assignees", force: :cascade do |t|
    t.bigint "address_id"
    t.string "addressable_type"
    t.bigint "addressable_id"
    t.string "usage"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["address_id"], name: "index_address_assignees_on_address_id"
    t.index ["addressable_type", "addressable_id"], name: "index_address_assignees_on_addressable_type_and_addressable_id"
  end

  create_table "address_books", force: :cascade do |t|
    t.bigint "address_id"
    t.bigint "contact_id"
    t.bigint "customer_id"
    t.datetime "last_used", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["address_id"], name: "index_address_books_on_address_id"
    t.index ["contact_id"], name: "index_address_books_on_contact_id"
    t.index ["customer_id"], name: "index_address_books_on_customer_id"
  end

  create_table "addresses", force: :cascade do |t|
    t.integer "run_id"
    t.string "ns_id"
    t.string "e_id"
    t.string "country"
    t.string "address1"
    t.string "address2"
    t.string "suburb"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.float "lat"
    t.float "lon"
    t.string "label"
    t.string "usage"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "unit_type_code"
    t.index ["address1"], name: "index_addresses_on_address1"
    t.index ["address2"], name: "index_addresses_on_address2"
    t.index ["country"], name: "index_addresses_on_country"
    t.index ["run_id"], name: "index_addresses_on_run_id"
  end

  create_table "admins", force: :cascade do |t|
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.boolean "limited", default: false
    t.boolean "analytics", default: false
  end

  create_table "barcode_check_points", force: :cascade do |t|
    t.bigint "barcode_id"
    t.jsonb "raw_data"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "status"
    t.string "tag"
    t.string "state"
    t.string "city"
    t.string "country"
    t.datetime "occurred_at", precision: nil
    t.string "note"
    t.index ["barcode_id"], name: "index_barcode_check_points_on_barcode_id"
  end

  create_table "barcodes", force: :cascade do |t|
    t.string "code"
    t.bigint "courier_id"
    t.bigint "order_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "ns_id"
    t.bigint "allocate_id"
    t.jsonb "raw_data"
    t.string "track_id"
    t.integer "franchisee_id"
    t.integer "customer_id"
    t.string "status"
    t.boolean "invoiceable", default: true
    t.datetime "printed_at", precision: nil
    t.bigint "external_barcode_id"
    t.datetime "coupled_at", precision: nil
    t.datetime "uncoupled_at", precision: nil
    t.bigint "package_id"
    t.string "sscc_prefix"
    t.string "sscc_range"
    t.integer "instruction_type", default: 0
    t.index ["code"], name: "index_barcodes_on_code", unique: true
    t.index ["courier_id"], name: "index_barcodes_on_courier_id"
    t.index ["external_barcode_id"], name: "index_barcodes_on_external_barcode_id"
    t.index ["order_id"], name: "index_barcodes_on_order_id"
    t.index ["package_id"], name: "index_barcodes_on_package_id"
  end

  create_table "carousels", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "link"
    t.string "image"
    t.integer "page"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "cart_items", force: :cascade do |t|
    t.bigint "cart_id"
    t.bigint "product_id"
    t.integer "quantity"
    t.integer "price"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["cart_id"], name: "index_cart_items_on_cart_id"
    t.index ["product_id"], name: "index_cart_items_on_product_id"
  end

  create_table "carts", force: :cascade do |t|
    t.bigint "product_order_id"
    t.integer "total"
    t.string "status"
    t.integer "session_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["product_order_id"], name: "index_carts_on_product_order_id"
  end

  create_table "contact_assignees", force: :cascade do |t|
    t.bigint "contact_id"
    t.string "contactable_type"
    t.bigint "contactable_id"
    t.string "usage"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["contact_id"], name: "index_contact_assignees_on_contact_id"
    t.index ["contactable_type", "contactable_id"], name: "index_contact_assignees_on_contactable_type_and_contactable_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "ns_id"
    t.string "e_id"
    t.integer "salutation"
    t.string "first_name"
    t.string "last_name"
    t.string "title"
    t.string "designation"
    t.string "phone"
    t.string "email"
    t.string "role"
    t.string "usage"
    t.string "company"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "fax"
    t.index ["company"], name: "index_contacts_on_company"
    t.index ["email"], name: "index_contacts_on_email"
    t.index ["first_name", "last_name"], name: "index_contacts_on_first_name_last_name"
    t.index ["phone"], name: "index_contacts_on_phone"
  end

  create_table "couriers", force: :cascade do |t|
    t.string "name"
    t.string "display_name"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "customers", force: :cascade do |t|
    t.bigint "dtd_contact_id"
    t.bigint "industry_category_id"
    t.bigint "franchisee_id"
    t.string "ns_id"
    t.string "e_id"
    t.string "company_name"
    t.string "email"
    t.string "phone"
    t.string "abn"
    t.integer "invoice_method"
    t.integer "status"
    t.jsonb "raw_data"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.boolean "shopable"
    t.string "abbr"
    t.jsonb "signup_info"
    t.string "label_first_name"
    t.string "label_last_name"
    t.string "label_phone_number"
    t.integer "pack_type", default: 1
    t.index ["dtd_contact_id"], name: "index_customers_on_dtd_contact_id"
    t.index ["franchisee_id"], name: "index_customers_on_franchisee_id"
    t.index ["industry_category_id"], name: "index_customers_on_industry_category_id"
  end

  create_table "daily_plans", force: :cascade do |t|
    t.integer "driver_id"
    t.date "scheduled_date"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "delivery_options", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "drivers", force: :cascade do |t|
    t.integer "employment_type"
    t.integer "run_id"
    t.string "ns_id"
    t.string "e_id"
    t.string "name"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "app_version"
    t.string "app_platform"
    t.index ["ns_id"], name: "index_drivers_on_ns_id"
    t.index ["run_id"], name: "index_drivers_on_run_id"
  end

  create_table "drivers_franchisees", force: :cascade do |t|
    t.bigint "driver_id"
    t.bigint "franchisee_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["driver_id"], name: "index_drivers_franchisees_on_driver_id"
    t.index ["franchisee_id"], name: "index_drivers_franchisees_on_franchisee_id"
  end

  create_table "email_templates", force: :cascade do |t|
    t.string "subject"
    t.text "body", null: false
    t.string "type"
    t.boolean "status", default: true
    t.bigint "customer_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["customer_id"], name: "index_email_templates_on_customer_id"
  end

  create_table "external_barcodes", force: :cascade do |t|
    t.string "code"
    t.string "type"
    t.bigint "barcode_id"
    t.datetime "printed_at", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "order_id"
    t.datetime "coupled_at", precision: nil
    t.datetime "uncoupled_at", precision: nil
    t.index ["code"], name: "index_external_barcodes_on_code", unique: true
  end

  create_table "extras", force: :cascade do |t|
    t.string "name"
    t.string "display_name"
    t.boolean "priceable"
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "ns_id"
    t.jsonb "raw_data"
  end

  create_table "feedbacks", force: :cascade do |t|
    t.integer "urgency"
    t.text "subject"
    t.text "body"
    t.bigint "customer_id"
    t.bigint "driver_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.jsonb "raw_data"
    t.index ["customer_id"], name: "index_feedbacks_on_customer_id"
    t.index ["driver_id"], name: "index_feedbacks_on_driver_id"
  end

  create_table "franchisees", force: :cascade do |t|
    t.string "ns_id"
    t.string "e_id"
    t.string "name"
    t.string "account_number"
    t.jsonb "raw_data"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["ns_id"], name: "index_franchisees_on_ns_id"
  end

  create_table "frequencies", force: :cascade do |t|
    t.bigint "procedure_template_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "weekday"
    t.index ["procedure_template_id"], name: "index_frequencies_on_procedure_template_id"
  end

  create_table "group_profiles", force: :cascade do |t|
    t.bigint "group_id"
    t.bigint "profile_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["group_id"], name: "index_group_profiles_on_group_id"
    t.index ["profile_id"], name: "index_group_profiles_on_profile_id"
  end

  create_table "group_roles", force: :cascade do |t|
    t.bigint "group_id"
    t.bigint "role_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["group_id"], name: "index_group_roles_on_group_id"
    t.index ["role_id"], name: "index_group_roles_on_role_id"
  end

  create_table "groups", force: :cascade do |t|
    t.bigint "customer_id"
    t.string "name"
    t.string "description"
    t.boolean "deletable", default: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["customer_id"], name: "index_groups_on_customer_id"
  end

  create_table "image_scans", force: :cascade do |t|
    t.bigint "image_id"
    t.bigint "scan_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["image_id"], name: "index_image_scans_on_image_id"
    t.index ["scan_id"], name: "index_image_scans_on_scan_id"
  end

  create_table "images", force: :cascade do |t|
    t.string "imageable_type"
    t.bigint "imageable_id"
    t.string "data"
    t.string "usage"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["imageable_type", "imageable_id"], name: "index_images_on_imageable_type_and_imageable_id"
  end

  create_table "industry_categories", force: :cascade do |t|
    t.string "ns_id"
    t.string "e_id"
    t.string "name"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "job_extras", force: :cascade do |t|
    t.integer "price"
    t.integer "quantity"
    t.bigint "job_id"
    t.bigint "extra_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "ns_id"
    t.string "raw_data"
    t.index ["extra_id"], name: "index_job_extras_on_extra_id"
    t.index ["job_id"], name: "index_job_extras_on_job_id"
    t.index ["ns_id"], name: "index_job_extras_on_ns_id"
  end

  create_table "job_groups", force: :cascade do |t|
    t.string "ns_id"
    t.string "name"
    t.integer "status"
    t.bigint "order_id"
    t.bigint "driver_id"
    t.jsonb "raw_data"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["driver_id"], name: "index_job_groups_on_driver_id"
    t.index ["ns_id"], name: "index_job_groups_on_ns_id"
    t.index ["order_id"], name: "index_job_groups_on_order_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.bigint "job_group_id"
    t.bigint "leg_template_id"
    t.bigint "stop_id"
    t.string "ns_id"
    t.string "e_id"
    t.integer "status"
    t.integer "source"
    t.datetime "scheduled_at", precision: nil
    t.datetime "scheduled_before", precision: nil
    t.datetime "scheduled_after", precision: nil
    t.datetime "finalised_at", precision: nil
    t.float "finalised_lat"
    t.float "finalised_lon"
    t.string "aasm_state"
    t.jsonb "raw_data"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "duration"
    t.boolean "unassigned", default: false
    t.string "location_type"
    t.index ["job_group_id"], name: "index_jobs_on_job_group_id"
    t.index ["leg_template_id"], name: "index_jobs_on_leg_template_id"
    t.index ["ns_id"], name: "index_jobs_on_ns_id"
    t.index ["stop_id"], name: "index_jobs_on_stop_id"
  end

  create_table "leads", force: :cascade do |t|
    t.string "business_name"
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone"
    t.string "address1"
    t.string "address2"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "frequency"
    t.string "comments"
    t.string "leadsource"
    t.string "ns_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "leg_templates", force: :cascade do |t|
    t.string "ns_id"
    t.string "name"
    t.bigint "leg_id"
    t.bigint "procedure_template_id"
    t.jsonb "raw_data"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.datetime "scheduled_at", precision: nil
    t.datetime "scheduled_before", precision: nil
    t.datetime "scheduled_after", precision: nil
    t.string "duration"
    t.string "notes"
    t.index ["leg_id"], name: "index_leg_templates_on_leg_id"
    t.index ["procedure_template_id"], name: "index_leg_templates_on_procedure_template_id"
  end

  create_table "legs", force: :cascade do |t|
    t.bigint "procedure_id"
    t.string "name"
    t.string "ns_id"
    t.jsonb "raw_data"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "sequence"
    t.index ["procedure_id"], name: "index_legs_on_procedure_id"
  end

  create_table "levels", force: :cascade do |t|
    t.bigint "product_promotion_id"
    t.integer "price"
    t.integer "quantity"
    t.integer "sequence"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["product_promotion_id"], name: "index_levels_on_product_promotion_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "locationable_type"
    t.integer "locationable_id"
    t.string "ns_id"
    t.string "name"
    t.string "type"
    t.string "category"
    t.string "usage"
    t.jsonb "raw_data"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "locations_orders", force: :cascade do |t|
    t.bigint "order_id"
    t.bigint "location_id"
    t.string "usage"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["location_id"], name: "index_locations_orders_on_location_id"
    t.index ["order_id"], name: "index_locations_orders_on_order_id"
    t.index ["usage"], name: "index_locations_orders_on_usage"
  end

  create_table "lodgment_point_mappings", force: :cascade do |t|
    t.string "suburb", null: false
    t.string "abbreviation", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "state"
    t.string "post_code"
  end

  create_table "lodgmentpoints", force: :cascade do |t|
    t.bigint "location_id"
    t.bigint "franchisee_id"
    t.bigint "courier_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["courier_id"], name: "index_lodgmentpoints_on_courier_id"
    t.index ["franchisee_id"], name: "index_lodgmentpoints_on_franchisee_id"
    t.index ["location_id"], name: "index_lodgmentpoints_on_location_id"
  end

  create_table "nominated_post_offices", force: :cascade do |t|
    t.integer "order"
    t.bigint "franchisee_id"
    t.bigint "post_office_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["franchisee_id"], name: "index_nominated_post_offices_on_franchisee_id"
    t.index ["post_office_id"], name: "index_nominated_post_offices_on_post_office_id"
  end

  create_table "notes", force: :cascade do |t|
    t.string "text"
    t.string "notable_type"
    t.bigint "notable_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["notable_type", "notable_id"], name: "index_notes_on_notable_type_and_notable_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.string "notifiable_type"
    t.bigint "notifiable_id"
    t.bigint "profile_id"
    t.string "body"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["notifiable_type", "notifiable_id"], name: "index_notifications_on_notifiable_type_and_notifiable_id"
    t.index ["profile_id"], name: "index_notifications_on_profile_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "number"
    t.string "ns_id"
    t.bigint "procedure_template_id"
    t.bigint "staff_id"
    t.string "pickup_instructions"
    t.string "delivery_instructions"
    t.string "po_number"
    t.string "type"
    t.integer "total_price"
    t.integer "customer_id"
    t.integer "status", default: 0
    t.datetime "scheduled_after", precision: nil
    t.datetime "scheduled_before", precision: nil
    t.datetime "fulfilled_at", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.datetime "scheduled_at", precision: nil
    t.integer "source"
    t.string "raw_data"
    t.string "receiver_ref"
    t.string "sender_ref"
    t.integer "track_status", default: 0
    t.bigint "driver_id"
    t.string "shopify_id"
    t.string "consignment_code"
    t.string "article_code"
    t.jsonb "shopify_raw_data"
    t.string "fulfillment_id"
    t.bigint "shop_id"
    t.string "order_name"
    t.string "connote_number"
    t.datetime "archived_at", precision: nil
    t.index ["connote_number"], name: "index_orders_on_connote_number", unique: true
    t.index ["customer_id"], name: "index_orders_on_customer_id"
    t.index ["procedure_template_id"], name: "index_orders_on_procedure_template_id"
    t.index ["shop_id"], name: "index_orders_on_shop_id"
    t.index ["staff_id"], name: "index_orders_on_staff_id"
    t.index ["type"], name: "index_orders_on_type"
  end

  create_table "packages", force: :cascade do |t|
    t.string "weight"
    t.string "length"
    t.string "height"
    t.string "width"
    t.bigint "product_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "source"
    t.bigint "shipment_order_id"
    t.bigint "toll_connote_id"
    t.string "connote_number"
    t.integer "sequence"
    t.string "service_description"
    t.index ["product_id"], name: "index_packages_on_product_id"
    t.index ["shipment_order_id"], name: "index_packages_on_shipment_order_id"
    t.index ["toll_connote_id"], name: "index_packages_on_toll_connote_id"
  end

  create_table "post_offices", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "pre_signups", force: :cascade do |t|
    t.boolean "existing"
    t.string "first_name"
    t.string "last_name"
    t.string "business_name"
    t.string "email"
    t.string "description"
    t.text "address"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "phone"
    t.string "source"
    t.integer "frequency"
  end

  create_table "procedure_templates", force: :cascade do |t|
    t.string "ns_id"
    t.string "name"
    t.integer "price"
    t.bigint "procedure_id"
    t.bigint "customer_id"
    t.jsonb "raw_data"
    t.datetime "ns_updated_at", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "job_group_ns_id"
    t.time "scheduled_at"
    t.time "scheduled_before"
    t.time "scheduled_after"
    t.string "duration"
    t.string "notes"
    t.string "location_type"
    t.index ["customer_id"], name: "index_procedure_templates_on_customer_id"
    t.index ["procedure_id"], name: "index_procedure_templates_on_procedure_id"
  end

  create_table "procedures", force: :cascade do |t|
    t.string "ns_id"
    t.string "name"
    t.integer "category"
    t.jsonb "raw_data"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "leg_no"
    t.string "description"
  end

  create_table "product_categories", force: :cascade do |t|
    t.string "ns_id"
    t.string "name"
    t.string "product_code"
    t.text "short_description"
    t.text "description"
    t.jsonb "raw_data"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "product_promotions", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "promotion_id"
    t.string "status"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["product_id"], name: "index_product_promotions_on_product_id"
    t.index ["promotion_id"], name: "index_product_promotions_on_promotion_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "ns_id"
    t.string "e_id"
    t.string "name"
    t.integer "price"
    t.string "short_description"
    t.string "delivery_info"
    t.string "product_description"
    t.string "service_details"
    t.string "delivery_details"
    t.integer "carton_size"
    t.integer "unique_id"
    t.string "code"
    t.bigint "product_category_id"
    t.jsonb "raw_data"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.boolean "inactive", default: false
    t.string "weight"
    t.string "length"
    t.string "height"
    t.string "width"
    t.string "service_description"
    t.integer "sequence", default: 0
    t.index ["ns_id"], name: "index_products_on_ns_id"
    t.index ["product_category_id"], name: "index_products_on_product_category_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "profileable_type"
    t.bigint "profileable_id"
    t.string "email", default: "", null: false
    t.string "password_digest", default: "", null: false
    t.string "token"
    t.integer "status"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: nil
    t.datetime "remember_created_at", precision: nil
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at", precision: nil
    t.datetime "last_sign_in_at", precision: nil
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at", precision: nil
    t.datetime "confirmation_sent_at", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["profileable_type", "profileable_id"], name: "index_profiles_on_profileable_type_and_profileable_id"
  end

  create_table "promotions", force: :cascade do |t|
    t.string "name"
    t.string "type"
    t.string "ns_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "purchase_cart_items", force: :cascade do |t|
    t.bigint "purchase_cart_id"
    t.integer "quantity"
    t.integer "price"
    t.bigint "product_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["product_id"], name: "index_purchase_cart_items_on_product_id"
    t.index ["purchase_cart_id"], name: "index_purchase_cart_items_on_purchase_cart_id"
  end

  create_table "purchase_carts", force: :cascade do |t|
    t.bigint "session_id"
    t.bigint "purchase_id"
    t.integer "total"
    t.string "status"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["purchase_id"], name: "index_purchase_carts_on_purchase_id"
    t.index ["session_id"], name: "index_purchase_carts_on_session_id"
  end

  create_table "purchases", force: :cascade do |t|
    t.bigint "driver_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["driver_id"], name: "index_purchases_on_driver_id"
  end

  create_table "quote_items", force: :cascade do |t|
    t.bigint "shipment_item_type_id"
    t.bigint "shipment_quote_id"
    t.integer "price"
    t.integer "quantity"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "product_id"
    t.bigint "barcode_id"
    t.integer "type"
    t.string "name"
    t.bigint "package_id"
    t.bigint "shipment_item_id"
    t.index ["package_id"], name: "index_quote_items_on_package_id"
    t.index ["shipment_item_id"], name: "index_quote_items_on_shipment_item_id"
    t.index ["shipment_item_type_id"], name: "index_quote_items_on_shipment_item_type_id"
    t.index ["shipment_quote_id"], name: "index_quote_items_on_shipment_quote_id"
  end

  create_table "reasons", force: :cascade do |t|
    t.bigint "job_id"
    t.string "body"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["job_id"], name: "index_reasons_on_job_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "controller_class"
    t.integer "api"
    t.integer "category"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "runs", force: :cascade do |t|
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "ns_id"
    t.string "name"
    t.string "raw_data"
    t.index ["ns_id"], name: "index_runs_on_ns_id"
  end

  create_table "scan_types", force: :cascade do |t|
    t.string "name"
    t.string "display_name"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "sequence"
  end

  create_table "scans", force: :cascade do |t|
    t.bigint "barcode_id"
    t.bigint "job_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "driver_id"
    t.string "type"
    t.bigint "customer_id"
    t.bigint "scan_type_id"
    t.datetime "deleted_at", precision: nil
    t.boolean "synced", default: false
    t.datetime "synced_at", precision: nil
    t.boolean "hidden"
    t.integer "cart_item_id"
    t.boolean "single_allocate", default: false
    t.index ["barcode_id", "scan_type_id"], name: "scan_unique_barcode_id_and_scan_type_id", unique: true, where: "(deleted_at IS NULL)"
    t.index ["barcode_id"], name: "index_scans_on_barcode_id"
    t.index ["job_id"], name: "index_scans_on_job_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "ns_id"
    t.string "e_id"
    t.bigint "service_type_id"
    t.string "name"
    t.decimal "price"
    t.jsonb "raw_data"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["service_type_id"], name: "index_services_on_service_type_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.bigint "profile_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["profile_id"], name: "index_sessions_on_profile_id"
  end

  create_table "settings", force: :cascade do |t|
    t.string "var", null: false
    t.text "value"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["var"], name: "index_settings_on_var", unique: true
  end

  create_table "shifts", force: :cascade do |t|
    t.integer "driver_id"
    t.integer "status"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "shipment_item_types", force: :cascade do |t|
    t.string "name"
    t.integer "category"
    t.float "width"
    t.float "height"
    t.float "length"
    t.float "weight"
    t.string "image"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "shipment_items", force: :cascade do |t|
    t.bigint "shipment_item_type_id"
    t.bigint "shipment_order_id"
    t.integer "price"
    t.integer "quantity"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "product_id"
    t.bigint "barcode_id"
    t.integer "type"
    t.string "description"
    t.bigint "external_barcode_id"
    t.string "fulfillment_id"
    t.jsonb "shopify_raw_data"
    t.string "shopify_id"
    t.string "name"
    t.bigint "package_id"
    t.index ["barcode_id"], name: "index_shipment_items_on_barcode_id"
    t.index ["external_barcode_id"], name: "index_shipment_items_on_external_barcode_id"
    t.index ["package_id"], name: "index_shipment_items_on_package_id"
    t.index ["shipment_item_type_id"], name: "index_shipment_items_on_shipment_item_type_id"
    t.index ["shipment_order_id"], name: "index_shipment_items_on_shipment_order_id"
  end

  create_table "shipment_quotes", force: :cascade do |t|
    t.bigint "pickup_location_id"
    t.bigint "delivery_location_id"
    t.bigint "customer_id"
    t.bigint "courier_id"
    t.string "ext_id"
    t.integer "amount"
    t.datetime "expired_at", precision: nil
    t.datetime "pickup_by", precision: nil
    t.datetime "deliver_by", precision: nil
    t.jsonb "submit_data"
    t.jsonb "raw_data"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "delivery_option_id"
    t.bigint "shipment_order_id"
    t.bigint "barcode_id"
    t.index ["courier_id"], name: "index_shipment_quotes_on_courier_id"
    t.index ["customer_id"], name: "index_shipment_quotes_on_customer_id"
    t.index ["delivery_location_id"], name: "index_shipment_quotes_on_delivery_location_id"
    t.index ["pickup_location_id"], name: "index_shipment_quotes_on_pickup_location_id"
  end

  create_table "shops", force: :cascade do |t|
    t.bigint "customer_id"
    t.string "access_token"
    t.string "store_name"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "default_location_id"
    t.index ["customer_id"], name: "index_shops_on_customer_id"
  end

  create_table "signatures", force: :cascade do |t|
    t.string "signaturable_type"
    t.bigint "signaturable_id"
    t.string "sign"
    t.string "name"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["signaturable_type", "signaturable_id"], name: "index_signatures_on_signaturable_type_and_signaturable_id"
  end

  create_table "sms_templates", force: :cascade do |t|
    t.text "body", null: false
    t.string "type"
    t.boolean "status", default: true
    t.bigint "customer_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["customer_id"], name: "index_sms_templates_on_customer_id"
  end

  create_table "staffs", force: :cascade do |t|
    t.bigint "customer_id"
    t.integer "employment_type"
    t.integer "status"
    t.string "invitation_token"
    t.datetime "invitation_token_sent_at", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "franchisee_id"
    t.index ["customer_id"], name: "index_staffs_on_customer_id"
  end

  create_table "stops", force: :cascade do |t|
    t.bigint "location_id"
    t.datetime "scheduled_after", precision: nil
    t.datetime "scheduled_before", precision: nil
    t.boolean "completed"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "daily_plan_id"
    t.string "name"
    t.index ["location_id"], name: "index_stops_on_location_id"
  end

  create_table "suburb_fees", force: :cascade do |t|
    t.bigint "franchisee_id"
    t.bigint "delivery_option_id"
    t.string "suburb"
    t.integer "price"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["delivery_option_id"], name: "index_suburb_fees_on_delivery_option_id"
    t.index ["franchisee_id"], name: "index_suburb_fees_on_franchisee_id"
  end

  create_table "supports", force: :cascade do |t|
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "toll1250s", force: :cascade do |t|
    t.bigint "barcode_id"
    t.jsonb "raw_data"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "file_name"
    t.index ["barcode_id"], name: "index_toll1250s_on_barcode_id"
  end

  create_table "toll_connotes", force: :cascade do |t|
    t.string "code"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "toll_sl_ids", force: :cascade do |t|
    t.string "abbr", null: false
    t.integer "initialize_value", null: false
    t.integer "finalize_value", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["abbr"], name: "index_toll_sl_ids_on_abbr", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "versions", force: :cascade do |t|
    t.integer "device_type"
    t.string "version_number"
    t.integer "major"
    t.integer "minor"
    t.integer "patch"
    t.boolean "force_update"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "webhooks", force: :cascade do |t|
    t.integer "kind"
    t.integer "shop_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "webhook_id"
  end

  add_foreign_key "barcodes", "external_barcodes"
  add_foreign_key "barcodes", "packages"
  add_foreign_key "cart_items", "carts"
  add_foreign_key "cart_items", "products"
  add_foreign_key "drivers_franchisees", "drivers"
  add_foreign_key "drivers_franchisees", "franchisees"
  add_foreign_key "email_templates", "customers"
  add_foreign_key "external_barcodes", "barcodes"
  add_foreign_key "feedbacks", "customers"
  add_foreign_key "feedbacks", "drivers"
  add_foreign_key "frequencies", "procedure_templates"
  add_foreign_key "job_groups", "drivers"
  add_foreign_key "job_groups", "orders"
  add_foreign_key "leg_templates", "legs"
  add_foreign_key "leg_templates", "procedure_templates"
  add_foreign_key "legs", "procedures"
  add_foreign_key "levels", "product_promotions"
  add_foreign_key "locations_orders", "locations"
  add_foreign_key "locations_orders", "orders"
  add_foreign_key "notifications", "profiles"
  add_foreign_key "orders", "shops"
  add_foreign_key "packages", "orders", column: "shipment_order_id"
  add_foreign_key "packages", "toll_connotes"
  add_foreign_key "procedure_templates", "customers"
  add_foreign_key "procedure_templates", "procedures"
  add_foreign_key "product_promotions", "products"
  add_foreign_key "product_promotions", "promotions"
  add_foreign_key "purchase_cart_items", "products"
  add_foreign_key "purchase_cart_items", "purchase_carts"
  add_foreign_key "purchase_carts", "purchases"
  add_foreign_key "purchase_carts", "sessions"
  add_foreign_key "purchases", "drivers"
  add_foreign_key "quote_items", "packages"
  add_foreign_key "quote_items", "shipment_items"
  add_foreign_key "sessions", "profiles"
  add_foreign_key "shipment_items", "external_barcodes"
  add_foreign_key "shipment_items", "packages"
  add_foreign_key "shops", "customers"
  add_foreign_key "sms_templates", "customers"
end
