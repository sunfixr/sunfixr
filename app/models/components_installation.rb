class ComponentsInstallation < ActiveRecord::Base
  belongs_to :component
  belongs_to :installation

  accepts_nested_attributes_for :component
end
