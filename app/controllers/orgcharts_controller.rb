class OrgchartsController < ApplicationController
  # GET /orgcharts
  # GET /orgcharts.xml
  def index
    @orgcharts = Orgchart.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @orgcharts }
    end
  end

  # GET /orgcharts/1
  # GET /orgcharts/1.xml
  def show
    @orgchart = Orgchart.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @orgchart }
    end
  end

  # GET /orgcharts/new
  # GET /orgcharts/new.xml
  def new
    @orgchart = Orgchart.new(:parent_id => params[:parent_id])

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @orgchart }
    end
  end

  # GET /orgcharts/1/edit
  def edit
    @orgchart = Orgchart.find(params[:id])
  end

  # POST /orgcharts
  # POST /orgcharts.xml
  def create
    @orgchart = Orgchart.new(params[:orgchart])

    respond_to do |format|
      if @orgchart.save
        flash[:notice] = 'Orgchart was successfully created.'
        format.html { redirect_to(@orgchart) }
        format.xml  { render :xml => @orgchart, :status => :created, :location => @orgchart }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @orgchart.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /orgcharts/1
  # PUT /orgcharts/1.xml
  def update
    @orgchart = Orgchart.find(params[:id])

    respond_to do |format|
      if @orgchart.update_attributes(params[:orgchart])
        flash[:notice] = 'Orgchart was successfully updated.'
        format.html { redirect_to(@orgchart) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @orgchart.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /orgcharts/1
  # DELETE /orgcharts/1.xml
  def destroy
    @orgchart = Orgchart.find(params[:id])
    @orgchart.destroy

    respond_to do |format|
      format.html { redirect_to(orgcharts_url) }
      format.xml  { head :ok }
    end
  end
end
