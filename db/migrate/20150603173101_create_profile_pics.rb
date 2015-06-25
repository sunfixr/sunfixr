class CreateProfilePics < ActiveRecord::Migration
  def change
    create_table :profile_pics do |t|
      t.string :project_id
      t.string :picture
      t.string :picture_id
      t.string :original_filename
      t.string :content_type
      t.boolean :is_profile
      t.text :notes
      t.timestamps null: false
    end
  end
end
