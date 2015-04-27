class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :installation_id
      t.string :subject
      t.text :post_text
      t.string :screen_name
      t.timestamps null: false
    end
  end
end
