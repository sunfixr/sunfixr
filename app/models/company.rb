class Company < ActiveRecord::Base
  has_many :components
  has_one :address, as: :addressable
  has_many :companies_installations
  has_many :installations, through: :companies_installations
  validates :name, presence: true

  accepts_nested_attributes_for :address
  before_validation :set_address_name

  protected
  def set_address_name
    address.name = name if address && address.name.blank?
  end
end

