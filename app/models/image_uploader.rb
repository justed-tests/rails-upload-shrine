require 'image_processing/mini_magick'

# magic inhabits this place
class ImageUploader < Shrine
  include ImageProcessing::MiniMagick

  plugin :processing
  plugin :versions
  plugin :delete_raw
  plugin :determine_mime_type
  plugin :cached_attachment_data
  plugin :remove_attachment

  Attacher.validate do
    validate_max_size 1.megabyte, message: 'file is too large'
    validate_mime_type_inclusion ['image/jpg', 'image/jpeg', 'image/png'],
                                 message: 'file is not an image'
  end

  process(:store) do |io|
    { original: io, thumb: resize_to_limit!(io.download, 50, 50) }
  end
end
