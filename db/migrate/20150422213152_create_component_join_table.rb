class CreateComponentJoinTable < ActiveRecord::Migration
  def change
    create_table :components_projects do |t|
      t.integer :component_id, null: false
      t.integer :project_id, null: false
      t.index [:component_id, :project_id], unique: true, name: 'index_by_component_project'
    end

  end
end

