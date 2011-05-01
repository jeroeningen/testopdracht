#car model
class Car < ActiveRecord::Base
  validates :brand, :presence => true
  validates :cartype, :presence => true
  validates :model, :presence => true

  acts_as_price :price, :validates => true, :comma_seperated => true, :currency => "EUR"

  CARTYPES = ["Sedan", "Hatchback", "Stationwagon", "Offroad", "SUV", "MPV", "Coupe", "Convertible", "Sportscar", "Cross-over"]
end