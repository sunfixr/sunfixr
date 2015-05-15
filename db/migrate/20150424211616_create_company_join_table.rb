class CreateCompanyJoinTable < ActiveRecord::Migration
  def change
    create_table :companies_projects do |t|
      t.belongs_to :project
      t.belongs_to :company
      t.timestamps
      t.index [:company_id, :project_id], unique: true, name: 'index_by_company_projects'
    end

  end
end
