require 'exifr/jpeg'

class ReadPhotoCoordinates < Struct.new(:photo_path)
  def self.call(photo_path)
    new(photo_path).call
  end

  def call
    data = EXIFR::JPEG.new(photo_path)
    return {} if data.gps.nil?

    {
        latitude: data.gps.latitude,
        longitude: data.gps.longitude
    }
  end
end