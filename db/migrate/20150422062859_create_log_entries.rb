class CreateLogEntries < ActiveRecord::Migration
  def change
    create_table :log_entries do |t|
      t.integer :project_id, null: false
      t.string :component_id
      t.string :user
      t.text :comments
      t.timestamps null: false
    end
  end
end
