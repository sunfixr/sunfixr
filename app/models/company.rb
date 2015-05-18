class Company < ActiveRecord::Base
  has_many :components
  has_one :address, as: :addressable
  has_many :companies_project, inverse_of: :company
  has_many :projects, through: :companies_project
  validates :name, presence: true

  accepts_nested_attributes_for :address
  before_validation :set_address_name

  protected
  def set_address_name
    address.name = name if address && address.name.blank?
  end
end

