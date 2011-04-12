class DropCountries < ActiveRecord::Migration
  def self.up
    drop_table :countries
    remove_column :users, :country_id
  end

  def self.down
    create_table :countries do |t|
      t.string :country_code
      t.string :country_name_en

      t.timestamps
    end
    
    add_column :users, :country_id, :integer
  end
end
