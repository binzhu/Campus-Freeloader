class AddBuildings < ActiveRecord::Migration
  def self.up
    Building.create(:buildname =>"Hendricks Chapel",:desc =>"University owned chapel", :addrln1=>"Hendricks Chapel", :addrln2=>"", :city=>"Syracuse", :state=>"NY", :zip=>"13244", :lat=>"43.037607", :lon=>"-76.135104" )
    Building.create(:buildname =>"Hall of Languages",:desc =>"College of Arts and Sciences", :addrln1=>"301 Hall of Languages", :addrln2=>"", :city=>"Syracuse", :state=>"NY", :zip=>"13244", :lat=>"43.038572", :lon=>"-76.134503" )
  end

  def self.down
  end
end
