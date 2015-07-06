# encoding: utf-8

class PictureUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick

  include Cloudinary::CarrierWave if Rails.env.production?
  include CarrierWave::MiniMagick unless Rails.env.production?


  # Choose what kind of storage to use for this uploader:
  storage :file unless Rails.env.production?
  #storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{::Rails.env}/#{mounted_as}/#{model.id}" unless Rails.env.production?
    # nil
  end


  process convert: 'png', :resize_to_fit => [1024, 768]

  version :medium do
    process resize_to_fit: [400, 300]
    process convert: 'png'
  end

  version :thumb do
    process resize_to_fit: [160, 120]
    process convert: 'png'
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  def default_url
    # For Rails 3.1+ asset pipeline compatibility:
    # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
    'project-img-1.png'
    # "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  end


  def public_id
    return model.short_name
  end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process :resize_to_fit => [50, 50]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
