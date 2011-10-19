require "pp"
class FileUploadsController < ApplicationController
  # GET /file_uploads
  # GET /file_uploads.xml
  def index
    @file_uploads = FileUpload.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @file_uploads }
    end
  end

  # GET /file_uploads/1
  # GET /file_uploads/1.xml
  def show
    @file_upload = FileUpload.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @file_upload }
    end
  end

  # GET /file_uploads/new
  # GET /file_uploads/new.xml
  def new
    @file_upload = FileUpload.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @file_upload }
    end
  end

  # GET /file_uploads/1/edit
  def edit
    @file_upload = FileUpload.find(params[:id])
  end

  # POST /file_uploads
  # POST /file_uploads.xml
  def create
    request.env.each {|key, value| pp "key:#{key} --------- value:#{value}" }
     pp  "----#{request.env}----"
    debugger
    puts params[:upload]
    @file_upload = FileUpload.new(params[:file_upload])
    debugger
     @file_upload.name = params[:url]
    @file_upload.name = FileUpload.get_name(params[:upload])
    @file_upload.file_type = FileUpload.get_type(params[:upload])
    upload = FileUpload.file_upload(params[:upload])
    respond_to do |format|
      if @file_upload.save && upload
        format.html { redirect_to(@file_upload, :notice => 'FileUpload was successfully created.') }
        format.xml  { render :xml => @file_upload, :status => :created, :location => @file_upload }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @file_upload.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /file_uploads/1
  # PUT /file_uploads/1.xml
  def update
    @file_upload = FileUpload.find(params[:id])

    respond_to do |format|
      if @file_upload.update_attributes(params[:file_upload])
        format.html { redirect_to(@file_upload, :notice => 'FileUpload was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @file_upload.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /file_uploads/1
  # DELETE /file_uploads/1.xml
  def destroy
    @file_upload = FileUpload.find(params[:id])
    @file_upload.destroy

    respond_to do |format|
      format.html { redirect_to(file_uploads_url) }
      format.xml  { head :ok }
    end
  end
end
