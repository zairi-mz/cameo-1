class PlanworktoolsController < ApplicationController
  # GET /planworktools
  # GET /planworktools.xml
  def index
    @planworktools = Planworktool.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @planworktools }
    end
  end

  # GET /planworktools/1
  # GET /planworktools/1.xml
  def show
    @planworktool = Planworktool.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @planworktool }
    end
  end

  # GET /planworktools/new
  # GET /planworktools/new.xml
  def new
    @planworktool = Planworktool.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @planworktool }
    end
  end

  # GET /planworktools/1/edit
  def edit
    @planworktool = Planworktool.find(params[:id])
  end

  # POST /planworktools
  # POST /planworktools.xml
  def create
    @planworktool = Planworktool.new(params[:planworktool])

    respond_to do |format|
      if @planworktool.save
        format.html { redirect_to(@planworktool, :notice => 'Planworktool was successfully created.') }
        format.xml  { render :xml => @planworktool, :status => :created, :location => @planworktool }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @planworktool.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /planworktools/1
  # PUT /planworktools/1.xml
  def update
    @planworktool = Planworktool.find(params[:id])

    respond_to do |format|
      if @planworktool.update_attributes(params[:planworktool])
        format.html { redirect_to(@planworktool, :notice => 'Planworktool was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @planworktool.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /planworktools/1
  # DELETE /planworktools/1.xml
  def destroy
    @planworktool = Planworktool.find(params[:id])
    @planworktool.destroy

    respond_to do |format|
      format.html { redirect_to(planworktools_url) }
      format.xml  { head :ok }
    end
  end
end
