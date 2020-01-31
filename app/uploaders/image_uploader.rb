class ImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  storage :aws

  process resize_to_fill: [800, 350]

end
