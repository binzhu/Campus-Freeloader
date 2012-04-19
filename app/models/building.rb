class Building < ActiveRecord::Base
  has_many :users
  has_many :events
  
  def address
    
  end
end
