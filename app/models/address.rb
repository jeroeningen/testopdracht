#model used to find the area near the zipcode
class Address
  GOOGLE_API_KEY = "ABQIAAAAFsjL_ySdbuJtGjezmrZK1xTJQa0g3IQ9GZqIMmInSLzwtGDKaBSiEsqQLyGI0BNbjNLcWmzxPaJyTQ"

  include ActiveModel::Validations

  require 'open-uri'
  require 'geonames'

  attr_accessor :zipcode, :url
  validates :zipcode, :presence => true, :zipcode_format => true

  #initialize
  def initialize(zipcode)
    self.zipcode = zipcode
    self.url = "http://maps.google.com/maps/geo?&key=#{Address::GOOGLE_API_KEY}&q=#{zipcode}%2CNederland&output=xml"
  end

  #use Google to find the matching address that belongs to the zipcode
  def self.find_area_by_zipcode(zipcode = nil)
    address = Address.new(zipcode)
    if address.valid?
      longitude, latitude = Hpricot(open(address.url)).search('coordinates').inner_html.split(",")

      address = Geonames::WebService.find_nearby_place_name(latitude, longitude)[0]

      return address.name if address and address.name != "Nederland"
    end
    ""
  end
end