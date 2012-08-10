class CreateBuildings < ActiveRecord::Migration
  def self.up
    create_table :buildings do |t|
      t.string :buildname
      t.string :desc
      t.string :addrln1
      t.string :addrln2
      t.string :city
      t.string :state
      t.string :zip
      t.decimal :lat
      t.decimal :lon

      t.timestamps
    end
  end

  def self.down
    drop_table :buildings
  end
end
