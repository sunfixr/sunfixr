class InstallationPost < ActiveRecord::Base
  belongs_to :post
  belongs_to :installation
end
