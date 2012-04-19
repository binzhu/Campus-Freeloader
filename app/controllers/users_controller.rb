class UsersController < ApplicationController
  # GET /users
  # GET /users.xml
  before_filter :authenticate, :only => ['edit','destroy']
  
  #Here I used an method called authenticate which overrides the
  #same method in application controller
  #The reason of doing so is to enable new user to register and
  #pass the before filter in the application controller
    def authenticate
    if session[:user_id].nil?
      flash[:alert] = 'You need to login to Proceed.'
      redirect_to :controller => 'admin', :action => 'login'
    #elsif session[:user_id] != params[:id]
     #  redirect_to(:back, :alert => "You can only edit/delete your own profile")
    end
  end
  
  
  def index
    @users = User.all.sort_by {|user| user.followers.count}.reverse
  
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(params[:id])
    @follow = Follow.new
    @follow.followed_user_id = params[:id]
    @follow.following_user_id = session[:user_id]
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def register
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to(@user, :notice => 'User was successfully created.')}
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(@user, :notice => 'User was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
end
