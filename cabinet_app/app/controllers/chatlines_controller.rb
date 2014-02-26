class ChatlinesController < ApplicationController
  # GET /chatlines
  # GET /chatlines.json


  def index
    @chatlines = Chatline.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @chatlines }
    end
  end

  # GET /chatlines/1
  # GET /chatlines/1.json
  def show
    @chatline = Chatline.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @chatline }
    end
  end

  # GET /chatlines/new
  # GET /chatlines/new.json
  def new
    @chatline = Chatline.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @chatline }
    end
  end

  # GET /chatlines/1/edit
  def edit
    @chatline = Chatline.find(params[:id])
  end

  # POST /chatlines
  # POST /chatlines.json
  def create

    if request.xhr?
      @chatline = Chatline.new
      @chatline.user = current_user
      @chatline.message = params['chatline']
      @chatline.email = current_user.email
    else
      @chatline = Chatline.new
      @chatline.user = current_user
      @chatline.message = params[:chatline]
    end

    respond_to do |format|
      if @chatline.save
        @chatlines = Chatline.all
        if request.xhr?
          format.json { render json: [@chatlines, @chatline]}
        else
          format.html { redirect_to locations_path }
        end
      else
        format.html { redirect_to locations_url }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end

  end

  def autoUpdate
    if request.xhr?

      @chatlines = Chatline.all

      respond_to do |format|
    if request.xhr?
        format.json { render json: @chatlines}
      else
        format.html { redirect_to locations_path }
      end
    end
    end
  end

  # PUT /chatlines/1
  # PUT /chatlines/1.json
  def update
    @chatline = Chatline.find(params[:id])

    respond_to do |format|
      if @chatline.update_attributes(params[:chatline])
        format.html { redirect_to @chatline, notice: 'Chatline was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @chatline.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chatlines/1
  # DELETE /chatlines/1.json
  def destroy
    @chatline = Chatline.find(params[:id])
    @chatline.destroy

    respond_to do |format|
      format.html { redirect_to chatlines_url }
      format.json { head :no_content }
    end
  end
end
