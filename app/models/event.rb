class Event < ActiveRecord::Base
  belongs_to :building
  has_many :attends
  belongs_to :user
  def event_date
    start_time.day
  end
  
  def event_hours
    start_time.strftime("%H:%M").to_s + "-" + end_time.strftime("%H:%M").to_s
  end
  
  
end
