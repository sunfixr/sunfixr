class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name, null: false
      t.string :slug, null: false
      t.text   :description
      t.date   :install_date
      t.timestamps null: false
      t.index :slug, unique: true
    end
  end
end
