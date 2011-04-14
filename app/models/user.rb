class User < ActiveRecord::Base
  validates :firstname, :presence => true
  validates :lastname, :presence => true
  validates :street, :presence => true
  validates :city, :presence => true
  validates :zipcode, :zipcode_format => true

  alias_attribute :fullname, :name

  def name
    "#{firstname} #{lastname}".strip
  end
end