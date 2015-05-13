class Installation < ActiveRecord::Base
  validates :name, presence: true
  validates :slug, presence: true, uniqueness: { case_sensitive: false }
  validates :install_date, presence: true
  validates :description, presence: true
  has_one :address, as: :addressable
  has_one :companies_installations
  has_one :company, through: :companies_installations
  has_many :components_installation, inverse_of: :installation
  has_many :components, through: :components_installation
  has_many :log_entries

  accepts_nested_attributes_for :company
  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :components
  accepts_nested_attributes_for :components_installation

  before_validation :set_address_name, :slugify



  def self.build
    installation = self.new
    installation.components_installation.build
  end


  def company_id
    company && company.id
  end

  def company_id=(my_id)
    self.company = Company.find(my_id.to_i) || self.company
  end

  def component_ids
    self.components_installation.collect{|ci| ci.component_id}
  end

  def component_ids=(ids=[])
    ids = [ids] unless ids.is_a?(Array)
    self.components << Component.find(ids.reject { |id| self.component_ids.include?(id) || id.blank?} ) if Component.exists?(id: ids)
  end

  protected
  def set_address_name
    address.name = name if address && address.name.blank?
  end

  def slugify
    self.slug = (self.slug && self.slug.to_url).blank? ? (self.name && self.name.to_url)  : self.slug.to_url
  end
end
