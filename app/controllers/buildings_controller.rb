class BuildingsController < ApplicationController
  # GET /buildings
  # GET /buildings.xml
  def index
    @buildings = Building.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @buildings }
    end
  end

  # GET /buildings/1
  # GET /buildings/1.xml
  def show
    @building = Building.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @building }
    end
  end

  # GET /buildings/new
  # GET /buildings/new.xml
  def new
    @building = Building.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @building }
    end
  end

  # GET /buildings/1/edit
  def edit
    @building = Building.find(params[:id])
  end

  # POST /buildings
  # POST /buildings.xml
  def create
    require 'net/http'
    @building = Building.new(params[:building])

    uri = "http://maps.google.com/maps/api/geocode/xml?address=" + @building.fulladdress.gsub(' ','+') + "&sensor=false"
    resp = Net::HTTP.get(URI.parse(uri))
    noko_resp = Nokogiri::XML(resp)
    
    noko_resp.xpath("//GeocodeResponse/result/geometry/location").each do |node|
        #puts node.xpath('lat').inner_text.inspect
        #puts node.xpath('lng').inner_text.inspect
        @building.lat = node.xpath('lat').inner_text
        @building.lon = node.xpath('lng').inner_text
    end
    
    
    respond_to do |format|
      if @building.save
        format.html { redirect_to(@building, :notice => 'Building was successfully created.') }
        format.xml  { render :xml => @building, :status => :created, :location => @building }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @building.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /buildings/1
  # PUT /buildings/1.xml
  def update
    @building = Building.find(params[:id])

    respond_to do |format|
      if @building.update_attributes(params[:building])
        format.html { redirect_to(@building, :notice => 'Building was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @building.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /buildings/1
  # DELETE /buildings/1.xml
  def destroy
    @building = Building.find(params[:id])
    @building.destroy

    respond_to do |format|
      format.html { redirect_to(buildings_url) }
      format.xml  { head :ok }
    end
  end
end
