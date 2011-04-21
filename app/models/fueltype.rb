#fueltype model
class Fueltype < ActiveRecord::Base
  validates :name, :presence => true
  validates :price_in_cents_per_liter, :presence => true, :numericality => {:greater_than => 0}

  alias_attribute :price_per_liter_in_cents, :price_in_cents_per_liter

  def price_per_liter
    if price_in_cents_per_liter.blank?
      ""
    else
      sprintf("%.2f", (price_in_cents_per_liter.to_f / 100))
    end
  end

  def price_per_liter=(price)
    factor = price.to_i < 6 ? 100 : 1
    self.price_in_cents_per_liter = (price.to_f * factor).to_s.to_i
  end
end