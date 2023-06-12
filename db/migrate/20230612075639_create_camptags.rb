class CreateCamptags < ActiveRecord::Migration[6.1]
  def change
    create_table :camptags do |t|
      t.integer  :campground_id,  null: false
      t.integer  :tag_id,         null: false
      
      t.timestamps
    end
  end
end
