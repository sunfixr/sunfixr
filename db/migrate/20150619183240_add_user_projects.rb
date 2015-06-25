class AddUserProjects < ActiveRecord::Migration
  def change
    create_table :users_projects do |t|
      t.integer :user_id
      t.integer :project_id
      t.string  :role
      t.index [:user_id, :project_id], unique: true
    end
  end


end
