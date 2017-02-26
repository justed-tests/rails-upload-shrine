# magic inhabits this place
class ImageUploader < Shrine
  Attacher.validate do
    validate_max_size 1.megabyte, message: 'file is too large'
    validate_mime_type_inclusion ['image/jpg', 'image/jpeg', 'image/png'],
                                 message: 'file is not an image'
  end
end
