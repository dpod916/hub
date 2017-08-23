class Address < ApplicationRecord
  belongs_to :legal_entity
  acts_as_mappable
  before_validation :geocode_address, :on => :create

  private
  def geocode_address
    @address = "#{self.first_line} #{self.city}, #{self.region} #{self.postal_code}, #{self.country}"
    geo=Geokit::Geocoders::MultiGeocoder.geocode (@address)
    errors.add(:full_address, "Could not Geocode address") if !geo.success
    self.lat, self.lng, self.full_address = geo.lat,geo.lng,geo.full_address if geo.success
  end
end

