class Installation < ActiveRecord::Base
  validates :name, presence: true
  validates :slug, presence: true, uniqueness: { case_sensitive: false }
  has_one :address, as: :addressable
  has_one :companies_installations
  has_one :company, through: :companies_installations
  has_many :components_installation
  has_many :components, through: :components_installation
  has_many :log_entries
  has_many :posts

  accepts_nested_attributes_for :company
  accepts_nested_attributes_for :address

  before_validation :set_address_name


  def company_id
    company && company.id
  end

  def company_id=(my_id)
    self.company = Company.find(my_id.to_i) || self.company
  end

  protected
  def set_address_name
    address.name = name if address && address.name.blank?
  end
end
