class RenameFueltypePricePerLiterInCents < ActiveRecord::Migration
  def self.up
    rename_column :fueltypes, :price_in_cents_per_liter, :price_per_liter
  end

  def self.down
    rename_column :fueltypes, :price_per_liter, :price_in_cents_per_liter
  end
end
