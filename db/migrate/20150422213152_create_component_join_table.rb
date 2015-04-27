class CreateComponentJoinTable < ActiveRecord::Migration
  def change
    create_join_table :components, :installations
    add_index :components_installations, [:component_id, :installation_id], unique: true, name: 'index_by_component_installation'
  end
end

