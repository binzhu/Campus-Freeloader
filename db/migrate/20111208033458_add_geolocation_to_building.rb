class AddGeolocationToBuilding < ActiveRecord::Migration
  def self.up
    add_column :buildings, :lat, :decimal
    add_column :buildings, :lon, :decimal
  end

  def self.down
    remove_column :buildings, :lon
    remove_column :buildings, :lat
  end
end
