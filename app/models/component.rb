class Component < ActiveRecord::Base
  validates :name, presence: true
  belongs_to :company
  belongs_to :component_type
  has_many :log_entries
  has_many :components_installation, inverse_of: :component
  has_many :installations, through: :components_installation



  def company_id
    company && company.id
  end

  def company_id=(my_id)
    self.company = Company.find(my_id.to_i) || self.company
  end


end
