class ComponentsProject < ActiveRecord::Base
  belongs_to :component
  belongs_to :project

  accepts_nested_attributes_for :component
end
