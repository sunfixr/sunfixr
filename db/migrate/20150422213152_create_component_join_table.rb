class CreateComponentJoinTable < ActiveRecord::Migration
  def change
    create_table :components_installations do |t|
      t.integer :component_id, null: false
      t.integer :installation_id, null: false
      t.index [:component_id, :installation_id], unique: true, name: 'index_by_component_installation'
    end

  end
end

