class Address < ActiveRecord::Base
  validates :name, presence: true
  belongs_to :addressable, polymorphic: true
  def country_name
    ISO3166::Country[self.country_id].name unless self.country_id.blank?
  end

end
