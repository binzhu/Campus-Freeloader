class AddUsers < ActiveRecord::Migration
  def self.up
    User.create( :username =>"Gellar", :password=>"test", :email=>"bzhu01@syr.edu", :fname=>"", :lname=>"", :building_id=>1 )
    User.create( :username =>"Ipod", :password=>"test", :email=>"bzhu01@syr.edu", :fname=>"", :lname=>"", :building_id=>1 )
    User.create( :username =>"admin2", :password=>"admin2", :email=>"bzhu01@syr.edu", :fname=>"Bin", :lname=>"Zhu", :building_id=>1 )
    User.create( :username =>"flight", :password=>"test", :email=>"bzhu01@syr.edu", :fname=>"", :lname=>"", :building_id=>1 )
    User.create( :username =>"Bradford", :password=>"test", :email=>"bzhu01@syr.edu", :fname=>"", :lname=>"", :building_id=>2 )
    User.create( :username =>"BrownLady", :password=>"test", :email=>"bzhu01@syr.edu", :fname=>"", :lname=>"", :building_id=>1 )
    User.create( :username =>"NegaEater", :password=>"test", :email=>"bzhu01@syr.edu", :fname=>"", :lname=>"", :building_id=>1 )
  end

  def self.down
  end
end
