class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate, :except => ['recent','login','index','register','aboutus']
  
  def authenticate
    if session[:user_id].nil?
      flash[:alert] = 'You need to login to Proceed.'
      redirect_to :controller => 'admin', :action => 'login'
    end
  end
  
  def cuer # this method is defined to find the user that is currently logged in
    User.find(session[:user_id])
  end
end
