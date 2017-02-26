# magic inhabits this place
class ImageUploader < Shrine
  plugin :determine_mime_type
  plugin :cached_attachment_data
  plugin :remove_attachment

  Attacher.validate do
    validate_max_size 1.megabyte, message: 'file is too large'
    validate_mime_type_inclusion ['image/jpg', 'image/jpeg', 'image/png'],
                                 message: 'file is not an image'
  end
end
