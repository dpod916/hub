class Location < ApplicationRecord
  # reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode  # auto-fetch address
  reverse_geocoded_by :latitude, :longitude do |obj,results|
    if geo = results.first
      obj.city = geo.city
      obj.state = geo.state
      obj.state_code = geo.state_code
      obj.postal_code  = geo.postal_code 
      obj.country = geo.country
      obj.country_code = geo.country_code
      obj.address = geo.address
    end
  end

  has_many :offices
  has_many :users, through: :offices
  has_many :companies, through: :users
  has_many :departments, through: :users
  has_many :divisions, through: :users
  has_many :profit_centers, through: :companies
  has_many :operating_companies, through: :companies
  has_one :business_units, through: :users

  def location_name
    arr = [self.city.split.map(&:capitalize).join(' ')]  unless self.city.nil?
    arr << self.state.split.map(&:capitalize).join(' ') unless self.state.nil?
    arr << self.country.split.map(&:capitalize).join(' ')  unless self.country.nil?

    if arr.count > 1 then
     get_location = arr.join(", ")
    elsif arr.count == 1
      get_location = arr.first
    else
      get_location = "N/A"
    end

    return get_location

  end
end
