class CreateInstallations < ActiveRecord::Migration
  def change
    create_table :installations do |t|
      t.string :name, null: false
      t.string :slug, null: false
      t.timestamps null: false
    end
    add_index :installations, :slug, unique: true
  end
end
