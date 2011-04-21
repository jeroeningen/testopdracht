Factory.define :jeroen, :class => "user" do |f|
  f.id(1)
  f.firstname "Jeroen"
  f.lastname "Van Ingen"
  f.zipcode "1024BJ"
  f.street "Beemsterstraat 176"
  f.city "Amsterdam"
end

Factory.define :rina, :parent => :jeroen do |f|
  f.id(2)
  f.firstname "Rina"
  f.street "Beemsterstraat 178"
end

Factory.define :frank, :class => "user" do |f|
  f.firstname "Frank"
  f.lastname "Van Ingen"
  f.zipcode "1024BJ"
  f.street "Beemsterstraat 176"
  f.city "Amsterdam"
end

Factory.define :euro95, :class => "fueltype" do |f|
  f.name "Euro 95"
  f.price_in_cents_per_liter "155"
end

Factory.define :euro98, :class => "fueltype" do |f|
  f.name "Euro 98"
  f.price_in_cents_per_liter "124"
end