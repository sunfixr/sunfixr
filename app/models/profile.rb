class Profile < ActiveRecord::Base
  belongs_to :project
  attr_accessor :profile, :profile_id, :profile_type
  mount_uploader :profile, ProfileUploader

end
