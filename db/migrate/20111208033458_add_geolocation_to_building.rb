class AddGeolocationToBuilding < ActiveRecord::Migration
  def self.up
    add_column :buildings, :lat, :double
    add_column :buildings, :lon, :double
  end

  def self.down
    remove_column :buildings, :lon
    remove_column :buildings, :lat
  end
end
