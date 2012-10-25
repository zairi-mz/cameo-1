class JobdescsController < ApplicationController
  # GET /jobdescs
  # GET /jobdescs.xml
  def index
    @jobdescs = Jobdesc.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @jobdescs }
    end
  end

  # GET /jobdescs/1
  # GET /jobdescs/1.xml
  def show
    @jobdesc = Jobdesc.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @jobdesc }
      format.pdf { render :layout => false }
    end
  end

  # GET /jobdescs/new
  # GET /jobdescs/new.xml
  def new
    @jobdesc = Jobdesc.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @jobdesc }
    end
  end

  # GET /jobdescs/1/edit
  def edit
    @jobdesc = Jobdesc.find(params[:id])
  end

  # POST /jobdescs
  # POST /jobdescs.xml
  def create
    @jobdesc = Jobdesc.new(params[:jobdesc])

    respond_to do |format|
      if @jobdesc.save
        flash[:notice] = 'Jobdesc was successfully created.'
        format.html { redirect_to(@jobdesc) }
        format.xml  { render :xml => @jobdesc, :status => :created, :location => @jobdesc }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @jobdesc.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /jobdescs/1
  # PUT /jobdescs/1.xml
  def update
    @jobdesc = Jobdesc.find(params[:id])

    respond_to do |format|
      if @jobdesc.update_attributes(params[:jobdesc])
        flash[:notice] = 'Jobdesc was successfully updated.'
        format.html { redirect_to(@jobdesc) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @jobdesc.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /jobdescs/1
  # DELETE /jobdescs/1.xml
  def destroy
    @jobdesc = Jobdesc.find(params[:id])
    @jobdesc.destroy

    respond_to do |format|
      format.html { redirect_to(jobdescs_url) }
      format.xml  { head :ok }
    end
  end
end
