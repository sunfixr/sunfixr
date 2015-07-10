class Address < ActiveRecord::Base
  validates :name, presence: true
  belongs_to :addressable, polymorphic: true
  def country_name
    ISO3166::Country[self.country_id].name unless self.country_id.blank?
  end
  def state_name
    ISO3166::Country.find_country_by_alpha2(self.country_id).states[state]['name'] unless self.country_id.blank? || self.state.blank?
  end

end
