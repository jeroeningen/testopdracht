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