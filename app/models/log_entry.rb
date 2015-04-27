class LogEntry < ActiveRecord::Base
  validates :installation, presence: true
  validates :user, presence: true
  belongs_to :installation
  belongs_to :component


  def component_id
    self.component && self.component.id
  end

  def component_id=(my_id)
    self.component = Component.find(my_id.to_i) || self.component
  end

  def installation_id
    self.installation && self.installation.id
  end

  def company_id=(my_id)
    self.company = Company.find(my_id.to_i) || self.company
  end
end
