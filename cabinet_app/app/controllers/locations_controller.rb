class LocationsController < ApplicationController
# layout false
  before_filter :authenticate_user!
  # GET /locations
  # GET /locations.json



  def index
    #@locations = Location.all

    @locations = current_user.locations
    @chatline = Chatline.new

    respond_to do |format|

      if request.xhr?
        format.json { render json: @locations }
        #format.html
      else
        format.html # index.html.erb
      end
    end
  end

  # GET /locations/1
  # GET /locations/1.json
  def show

    if request.xhr?
      @location = Location.find(params['id'])
    else
      @location = Location.find(params[:id])
    end

    respond_to do |format|
      if request.xhr?
        format.json { render json: @location }
      else
        format.html # show.html.erb
      end
    end

  end

  def landing

    respond_to do |format|
      format.html
    end
  end

  # GET /locations/new
  # GET /locations/new.json
  def new
    @location = Location.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @location }
    end
  end

  # GET /locations/1/edit
  def edit

    @location = Location.find(params[:id])
    respond_to do |format|
      if request.xhr?
        format.json { render json: @location }
      else
        format.html { redirect_to locations_url }
      end
    end
  end

  # GET /locations/1/share
  def share

    user = User.where("email = ?", params[:email])

    if user != []
      @location = Location.find(params[:id])
      loc = Location.new
      loc.lat = @location.lat
      loc.lng = @location.lng
      loc.name = @location.name
      loc.address = @location.address
      loc.pwd = @location.pwd

      loc.save
      loc.users << user
      #@location.save
      @locations = current_user.locations
      UserMailer.share_location(user.first, loc).deliver
      respond_to do |format|
        if request.xhr?
          format.json { render json: @locations }
        else
          format.html { redirect_to locations_url }
        end
      end
    else
      respond_to do |format|
        if request.xhr?
          format.json { render json: user}
        else
          format.html { redirect_to locations_url }
        end
      end
    end
  end

  # POST /locations
  # POST /locations.json
  def create

    if request.xhr?
      @location = Location.new
      @location.lat = params['lat'].to_f
      @location.lng = params['lng'].to_f
      @location.name = params['name']
      @location.address = params['address']
      @location.pwd = params['pwd']
      @location.users << current_user
    else
      @location = Location.new(params[:location])
      @location.users << current_user
    end

    respond_to do |format|
      if @location.save

        @locations = current_user.locations
        if request.xhr?
          format.json { render json: @location}
        else
          format.html { redirect_to locations_path }
        end
      else
        format.html { redirect_to locations_url }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /locations/1
  # PUT /locations/1.json
  def update

    @location = Location.find(params[:id])

    if request.xhr?
      @location.name = params['name']
      @location.address = params['address']
      @location.pwd = params['pwd']
    else
      @location.update_attributes(params[:location])
    end

    respond_to do |format|
      if @location.save
        puts "<<<<<<<#{@location.pwd}>>>>>>"
        @locations = current_user.locations
        if request.xhr?
          format.json { render json: @locations}
        else
          format.html { redirect_to locations_path }
        end
      else
        format.html { redirect_to locations_url }
        format.json { render json: @locations.errors, status: :unprocessable_entity }
      end
    end

  end

  # DELETE /locations/1
  # DELETE /locations/1.json
  def destroy

    @location = Location.find(params[:id])

    @location.destroy
    @locations = current_user.locations

    respond_to do |format|
      if request.xhr?
        format.json { render json: @locations}
      else
        format.html { redirect_to locations_path }
      end

    end
  end
end
