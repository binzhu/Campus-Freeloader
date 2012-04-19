class User < ActiveRecord::Base
  belongs_to :building
  has_many :attends
  has_many :events
  has_many :followed_follows, :class_name => 'Follow',
            :foreign_key =>'followed_user_id'
  has_many :following_follows, :class_name => 'Follow',
            :foreign_key =>'following_user_id'

  
  private
  def password_confirmation
    @password_condirmation
  end
  
  public
  def password_confirmation=pw
    @password_confirmation = pw 
  end
  
  def discovery_cnt
    cur=User.find_by_id(id) # attribute in model file can be accessed directly?
    cur.events.count
  end
  
  def following
    following_follows.map do |f|
      f.followed_user
    end
  end
    def followers
    followed_follows.map do |f|
      f.following_user
    end
  end
    
  def friends
    followers+following
  end

  
  validates :username, :presence =>true, :uniqueness => true
  validates :password, :presence =>true, :confirmation=> true
  
end
