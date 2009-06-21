class User < ActiveRecord::Base
  belongs_to :country

  validates_presence_of :firstname
  validates_presence_of :lastname
  validates_presence_of :street
  validates_presence_of :city
  validates_format_of :zipcode, :with => /^[0-9]{4}\s{0,1}[a-zA-Z]{2}$/

end
