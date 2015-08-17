class Component < ActiveRecord::Base
  validates :name, presence: true
  belongs_to :company
  belongs_to :component_type
  has_many :log_entries
  has_many :components_project, inverse_of: :component
  has_many :projects, through: :components_project
  has_many :attachments, as: :attachable

  accepts_nested_attributes_for :attachments, allow_destroy: true

  def company_id
    company && company.id
  end

  def company_id=(my_id)
    self.company = Company.find(my_id.to_i) || self.company
  end


end
