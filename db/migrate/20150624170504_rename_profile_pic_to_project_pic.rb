class RenameProfilePicToProjectPic < ActiveRecord::Migration
  def change
    rename_table :profile_pics, :project_pics
  end
end
