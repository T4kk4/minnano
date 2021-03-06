class AssetUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  include CarrierWave::RMagick
  # include CarrierWave::MiniMagick
  include Piet::CarrierWaveExtension

  # Choose what kind of storage to use for this uploader:
  if Rails.env.production?
    storage :fog
  else
    storage :file
  end

  process :fix_rotate
  def fix_rotate
    manipulate! do |img|
      img = img.auto_orient
      img = yield(img) if block_given?
      img
    end
  end

  process convert: 'jpg'
  process optimize: [quality: 40]

  process :dimensions
  def dimensions
    manipulate! do |img|
      model.width = img.columns
      model.height = img.rows
      img
    end
  end

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    # "images/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    "images"
  end

  def url
    if Rails.env.production?
      return "#{ENV['ASSET_HOST']}/#{path}"
    end
    super
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
  process resize_to_limit: [1280, 1280]

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process resize_to_fit: [50, 50]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_whitelist
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

  def filename
    "#{secure_token}.#{file.extension}" if original_filename.present?
  end

  protected
  def secure_token
    var = :"@#{mounted_as}_secure_token"
    model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.uuid)
  end
end
