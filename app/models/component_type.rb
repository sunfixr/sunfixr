class ComponentType < ActiveRecord::Base
  validates :name, presence: true
  has_many :components
end
