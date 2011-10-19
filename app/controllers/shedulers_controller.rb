class ShedulersController < ApplicationController
  # GET /shedulers
  # GET /shedulers.xml
  def index
    @shedulers = Sheduler.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @shedulers }
    end
  end

  # GET /shedulers/1
  # GET /shedulers/1.xml
  def show
    @sheduler = Sheduler.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @sheduler }
    end
  end

  # GET /shedulers/new
  # GET /shedulers/new.xml
  def new
    @sheduler = Sheduler.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @sheduler }
    end
  end

  # GET /shedulers/1/edit
  def edit
    @sheduler = Sheduler.find(params[:id])
  end

  # POST /shedulers
  # POST /shedulers.xml
  def create
    @sheduler = Sheduler.new(params[:sheduler])

    respond_to do |format|
      if @sheduler.save
        format.html { redirect_to(@sheduler, :notice => 'Sheduler was successfully created.') }
        format.xml  { render :xml => @sheduler, :status => :created, :location => @sheduler }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @sheduler.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /shedulers/1
  # PUT /shedulers/1.xml
  def update
    @sheduler = Sheduler.find(params[:id])

    respond_to do |format|
      if @sheduler.update_attributes(params[:sheduler])
        format.html { redirect_to(@sheduler, :notice => 'Sheduler was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @sheduler.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /shedulers/1
  # DELETE /shedulers/1.xml
  def destroy
    @sheduler = Sheduler.find(params[:id])
    @sheduler.destroy

    respond_to do |format|
      format.html { redirect_to(shedulers_url) }
      format.xml  { head :ok }
    end
  end
end
