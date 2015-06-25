class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.references :attachable, polymorphic: true
      t.string :attachment
      t.string :original_filename
      t.string :content_type
      t.timestamps null: false
    end
  end
end
