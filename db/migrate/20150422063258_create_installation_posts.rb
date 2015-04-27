class CreateInstallationPosts < ActiveRecord::Migration
  def change
    create_table :installation_posts do |t|
      t.integer :installation_id
      t.integer :post_id
      t.timestamps null: false
    end
    add_index :installation_posts, [:installation_id,:post_id], unique: true
  end
end
