class AdminController < ApplicationController
  def login 
    if request.post?
      user=User.find_by_username(params[:username])
      if ! user.nil? && user.password == params[:password]
        session[:user_id] = user.id
        redirect_to(:controller => 'events', :action => 'recent')
      else
        redirect_to(:back, :alert => "Invalid login")
      end
    end
  end

  def logout
    session[:user_id]=nil
    redirect_to(:controller => 'admin', :action=> 'login')
  end

end
