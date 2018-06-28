# frozen_string_literal: true

class TripImage < ApplicationRecord
  belongs_to :trip

  before_save :set_gps_location
  mount_uploader :image, ImageUploader

  def set_gps_location
    return unless try(:image).try(:path)
    coordinates = ReadPhotoCoordinates.call(image.path)
    self.lat = coordinates[:latitude]
    self.lng = coordinates[:longitude]
  end

  def coords
    [lat, lng]
  end
end
