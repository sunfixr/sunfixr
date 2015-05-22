class AddAuthToken < ActiveRecord::Migration
  def change
    add_column :users, :encrypted_authentication_token, :string
    add_column :users, :encrypted_authentication_token_salt, :string
    add_column :users, :encrypted_authentication_token_iv, :string
  end
end
