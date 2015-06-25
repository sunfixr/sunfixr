class Attachment < ActiveRecord::Base
  mount_uploader :attachment, AttachmentUploader
  belongs_to :attachable, polymorphic: true

  validates_presence_of :attachment
  validates_integrity_of :attachment

  before_save :update_attachment_attributes

  delegate :url, :size, :path, to: :attachment

  alias_attribute :filename, :original_filename

  private

  def update_attachment_attributes
    if attachment.present? && attachment_changed?
      self.original_filename = attachment.file.original_filename
      self.content_type = attachment.file.content_type
    end
  end
end
