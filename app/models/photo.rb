# photos for all
class Photo < ApplicationRecord
  include ImageUploader[:image] # like a table column
end
