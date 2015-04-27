class ComponentsInstallation < ActiveRecord::Base
  belongs_to :component
  belongs_to :installation
end
