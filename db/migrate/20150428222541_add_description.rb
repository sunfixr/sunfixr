class AddDescription < ActiveRecord::Migration
  def change
    add_column :installations, :description, :string
    add_column :installations, :install_date, :date
  end
end
