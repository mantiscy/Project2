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
    @chatline = Chatline.new(params[:chatline])

    respond_to do |format|
      if @chatline.save
        format.html { redirect_to @chatline, notice: 'Chatline was successfully created.' }
        format.json { render json: @chatline, status: :created, location: @chatline }
      else
        format.html { render action: "new" }
        format.json { render json: @chatline.errors, status: :unprocessable_entity }
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
