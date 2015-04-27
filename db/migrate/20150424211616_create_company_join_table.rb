class CreateCompanyJoinTable < ActiveRecord::Migration
  def change
    create_table :companies_installations do |t|
      t.belongs_to :installation
      t.belongs_to :company
      t.timestamps
    end
    add_index :companies_installations, [:company_id, :installation_id], unique: true, name: 'index_by_company_installation'
  end
end
