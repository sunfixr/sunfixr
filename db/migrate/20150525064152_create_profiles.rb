class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string   "profile"
      t.integer  "project_id"
      t.string   "profile_type"
      t.timestamps null: false
    end
  end
end
