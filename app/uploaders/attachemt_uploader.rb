class AttachemtUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  # storage :file
  # storage :fog
  if Rails.env.development? || Rails.env.test?
    storage :file
  else
    storage :fog
  end

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    # "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"


    # if Rails.env.production?
    #   "#{ENV['AWS_ROOT_DIR']}attachments/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    # else
    #   "#{ENV['AWS_ROOT_DIR']}#{Rails.env}/attachments/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    # end
    # "uploads/#{ENV['AWS_ROOT_DIR']}#{Rails.env}/attachments/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    "#{ENV['AWS_ROOT_DIR']}#{Rails.env}/uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url(*args)
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process scale: [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process resize_to_fit: [50, 50]
  # end

  version :thumb do
    process resize_to_fit: [200, 200]
  end

  version :small_thumb, from_version: :thumb do
    process resize_to_fit: [20, 20]
  end

  # Add an allowlist of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_allowlist
    %w(jpg jpeg gif png pdf doc docx xls xlsx)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end
end
