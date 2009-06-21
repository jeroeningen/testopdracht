class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.string :zipcode
      t.integer :country_id
      t.string :street
      t.string :city

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
