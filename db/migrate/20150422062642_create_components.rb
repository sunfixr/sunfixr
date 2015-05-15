class CreateComponents < ActiveRecord::Migration
  def change
    create_table :components do |t|
      t.integer :component_type_id
      t.integer :company_id
      t.string :name
      t.text   :description
      t.string :part_number
      t.string :serial_number
      t.text :comments
      t.timestamps null: false
    end
  end
end
