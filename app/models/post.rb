class Post < ActiveRecord::Base
  belongs_to :installation
  validates :screen_name, presence: true
end
