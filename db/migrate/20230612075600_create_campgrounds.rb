class CreateCampgrounds < ActiveRecord::Migration[6.1]
  def change
    create_table :campgrounds do |t|
      t.integer  :user_id
      t.string   :name,            null: false
      t.text     :description
      t.string   :address,         null: false
      t.float    :latitude
      t.float    :longitude
      t.string   :phone_number
      t.string   :business_hours
      t.string   :check_in
      t.string   :check_out
      t.string   :station_line
      t.string   :station_name
      t.integer  :station_walk
      t.string   :busstop_line
      t.string   :busstop_name
      t.integer  :busstop_walk
      t.integer  :is_confirmed,    null: false, default: 0
      t.string   :rejection_reason
      t.float    :rating
      t.string   :camp_url

      t.timestamps
    end
  end
end
