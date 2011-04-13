class Address
  GOOGLE_API_KEY = "ABQIAAAAFsjL_ySdbuJtGjezmrZK1xTJQa0g3IQ9GZqIMmInSLzwtGDKaBSiEsqQLyGI0BNbjNLcWmzxPaJyTQ"
 
  include ActiveModel::Validations

  require 'open-uri'
  require 'geonames'
 
  attr_accessor :zipcode
  validates :zipcode, :presence => true, :zipcode_format => true
  
  #initialize
  def initialize(zipcode)
    self.zipcode = zipcode
  end

  #use Google to find the matching address that belongs to the zipcode
  def self.find_area_by_zipcode(zipcode = nil)
    address = Address.new(zipcode)
    if address.valid?
      url = "http://maps.google.com/maps/geo?&key=#{Address::GOOGLE_API_KEY}&q=#{address.zipcode}%2CNederland&output=xml"      
      begin
        longitude, latitude = Hpricot(open(url)).search('coordinates').inner_html.split(",")
      rescue
        return ""
      end
      
      #sometimes the webservices fails so try five times to receive the address if address is not received yet
      5.times do
        address = Geonames::WebService.find_nearby_place_name(latitude, longitude)[0]
        break if address
      end
      
      return address.name if address and address.name != "Nederland"
    end
    ""
  end


end
