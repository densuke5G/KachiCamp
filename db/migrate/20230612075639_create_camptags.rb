class CreateCamptags < ActiveRecord::Migration[6.1]
  def change
    create_table :camptags do |t|
      t.references :campground, foreign_key: true
      t.references :tag, foreign_key: true

      t.timestamps
    end

    add_index :camptags, [:campground_id, :tag_id], unique: true
  end
end
