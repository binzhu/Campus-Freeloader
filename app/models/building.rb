class Building < ActiveRecord::Base
  has_many :users
  has_many :events
  
  def fulladdress
    addrln1 + ","+ addrln2 + "," + city + ","+ state + ","+ zip
  end
  
  

end
