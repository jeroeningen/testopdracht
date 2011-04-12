class Address
  
  include ActiveModel::Validations

  require 'geox'
  require 'geonames'
 
  attr_accessor :zipcode
  validates :zipcode, :presence => true, :zipcode_format => true
  
  #initialize
  def initialize(zipcode)
    self.zipcode = zipcode
  end

  #use Google to find the matching address that belongs to the zipcode
  def self.address(zipcode = nil)
    address = Address.new(zipcode)
    if address.valid?
      geocoder = GeoX::Geocoder.new(:geoengine => GeoX::Google)
      location = {:post_code => zipcode + ',Nederland'}
      geocode = geocoder.geocode(location)[0]
      
      #sometimes the webservices fails so try five times to receive the address if address is not received yet
      5.times do
        address = Geonames::WebService.find_nearby_place_name(geocode.latitude, geocode.longitude)[0]
        break if address
      end
      
      return address.name if address and address.name != "Nederland"
    end
    ""
  end


end
