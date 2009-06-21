class Address < ActiveRecord::BaseWithoutTable

 require 'geox'
 require 'geonames'

  def self.address(zipcode)
    return "" if zipcode == ""
    geocoder = GeoX::Geocoder.new(:geoengine => GeoX::Google)
    location = {:post_code => zipcode + ',Netherlands'}
    geocode = geocoder.geocode(location)

    return Geonames::WebService.find_nearby_place_name geocode[0].latitude, geocode[0].longitude
  end


end
