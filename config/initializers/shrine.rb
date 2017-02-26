require 'shrine'
require 'shrine/storage/file_system'

Shrine.plugin :activerecord # or :activerecord
Shrine.plugin :logging, logger: Rails.logger # for non-Rails apps

Shrine.storages = {
  cache: Shrine::Storage::FileSystem.new('public', prefix: 'uploads/cache'),
  store: Shrine::Storage::FileSystem.new('public', prefix: 'uploads/store')
}