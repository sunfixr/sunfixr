class ProjectPic < ActiveRecord::Base
  mount_uploader :picture, PictureUploader
  belongs_to :project

  validates_presence_of :picture
  validates_integrity_of :picture

  before_save :update_picture_attributes

  delegate :url, :size, :path, to: :picture

  alias_attribute :filename, :original_filename
  alias_attribute :short_name, :original_filename
  private

  def update_picture_attributes
    if picture.present? && picture_changed?
      self.original_filename = picture.file.original_filename
      self.content_type = picture.file.content_type
    end
  end
end
