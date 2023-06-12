class CreateCampgrounds < ActiveRecord::Migration[6.1]
  def change
    create_table :campgrounds do |t|
      t.integer  :user_id,         null: false
      t.string   :name,            null: false
      t.text     :description          
      t.string   :address,         null: false
      t.float    :latitude       
      t.float    :longitude        
      t.string   :phone_number    
      t.string   :business_hours         
      t.string   :check_in           
      t.string   :check_out         
      t.string   :station_line,    null: false
      t.string   :station_name,    null: false
      t.integer  :station_walk,    null: false
      t.string   :busstop_line,    null: false
      t.string   :busstop_name,    null: false
      t.integer  :busstop_walk,    null: false
      t.integer  :is_confirmed,    null: false, default: 0
      t.string   :rejection_reason
      
      t.timestamps
    end
  end
end
