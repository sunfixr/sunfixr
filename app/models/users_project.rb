class UsersProject < ActiveRecord::Base
  belongs_to :user
  belongs_to :project

  validates_presence_of :project_id, :user_id
  ROLES = %w[admin sunfixr user banned]
end