class PlanworkpartsController < ApplicationController
  # GET /planworkparts
  # GET /planworkparts.xml
  def index
    @planworkparts = Planworkpart.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @planworkparts }
    end
  end

  # GET /planworkparts/1
  # GET /planworkparts/1.xml
  def show
    @planworkpart = Planworkpart.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @planworkpart }
    end
  end

  # GET /planworkparts/new
  # GET /planworkparts/new.xml
  def new
    @planworkpart = Planworkpart.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @planworkpart }
    end
  end

  # GET /planworkparts/1/edit
  def edit
    @planworkpart = Planworkpart.find(params[:id])
  end

  # POST /planworkparts
  # POST /planworkparts.xml
  def create
    @planworkpart = Planworkpart.new(params[:planworkpart])

    respond_to do |format|
      if @planworkpart.save
        format.html { redirect_to(@planworkpart, :notice => 'Planworkpart was successfully created.') }
        format.xml  { render :xml => @planworkpart, :status => :created, :location => @planworkpart }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @planworkpart.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /planworkparts/1
  # PUT /planworkparts/1.xml
  def update
    @planworkpart = Planworkpart.find(params[:id])

    respond_to do |format|
      if @planworkpart.update_attributes(params[:planworkpart])
        format.html { redirect_to(@planworkpart, :notice => 'Planworkpart was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @planworkpart.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /planworkparts/1
  # DELETE /planworkparts/1.xml
  def destroy
    @planworkpart = Planworkpart.find(params[:id])
    @planworkpart.destroy

    respond_to do |format|
      format.html { redirect_to(planworkparts_url) }
      format.xml  { head :ok }
    end
  end
end
