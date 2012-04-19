class FollowsController < ApplicationController
  # GET /follows
  # GET /follows.xml
  
  before_filter :authenticate, :except => 'index'
  # => ['show','login','index', 'register','aboutus']
  def authenticate
    if session[:user_id].nil?
      flash[:alert] = 'You need to login to Proceed.'
      redirect_to :controller => 'admin', :action => 'login'
    end
  end
  
  def index
    @follows = Follow.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @follows }
    end
  end

  # GET /follows/1
  # GET /follows/1.xml
  def show
    @follow = Follow.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @follow }
    end
  end

  # GET /follows/new
  # GET /follows/new.xml
  def new
    @follow = Follow.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @follow }
    end
  end

  # GET /follows/1/edit
  def edit
    @follow = Follow.find(params[:id])
  end

  # POST /follows
  # POST /follows.xml
  def create
    @follow = Follow.new(params[:follow])

    respond_to do |format|
      if @follow.save
        format.html { redirect_to :back }
        format.xml  { render :xml => @follow, :status => :created, :location => @follow }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @follow.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /follows/1
  # PUT /follows/1.xml
  def update
    @follow = Follow.find(params[:id])

    respond_to do |format|
      if @follow.update_attributes(params[:follow])
        format.html { redirect_to(@follow, :notice => 'Follow was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @follow.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /follows/1
  # DELETE /follows/1.xml
  def destroy
    @follow = Follow.find(params[:id])
    @follow.destroy

    respond_to do |format|
      format.html { redirect_to(follows_url) }
      format.xml  { head :ok }
    end
  end
end
