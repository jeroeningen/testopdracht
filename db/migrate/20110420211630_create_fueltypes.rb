class CreateFueltypes < ActiveRecord::Migration
  def self.up
    create_table :fueltypes do |t|
      t.string :name
      t.integer :price_in_cents_per_liter
      t.timestamps
    end
  end

  def self.down
    drop_table :fueltypes
  end
end
