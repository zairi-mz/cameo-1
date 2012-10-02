class PlanworkhoursController < ApplicationController
  # GET /planworkhours
  # GET /planworkhours.xml
  def index
    @planworkhours = Planworkhour.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @planworkhours }
    end
  end

  # GET /planworkhours/1
  # GET /planworkhours/1.xml
  def show
    @planworkhour = Planworkhour.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @planworkhour }
    end
  end

  # GET /planworkhours/new
  # GET /planworkhours/new.xml
  def new
    @planworkhour = Planworkhour.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @planworkhour }
    end
  end

  # GET /planworkhours/1/edit
  def edit
    @planworkhour = Planworkhour.find(params[:id])
  end

  # POST /planworkhours
  # POST /planworkhours.xml
  def create
    @planworkhour = Planworkhour.new(params[:planworkhour])

    respond_to do |format|
      if @planworkhour.save
        format.html { redirect_to(@planworkhour, :notice => 'Planworkhour was successfully created.') }
        format.xml  { render :xml => @planworkhour, :status => :created, :location => @planworkhour }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @planworkhour.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /planworkhours/1
  # PUT /planworkhours/1.xml
  def update
    @planworkhour = Planworkhour.find(params[:id])

    respond_to do |format|
      if @planworkhour.update_attributes(params[:planworkhour])
        format.html { redirect_to(@planworkhour, :notice => 'Planworkhour was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @planworkhour.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /planworkhours/1
  # DELETE /planworkhours/1.xml
  def destroy
    @planworkhour = Planworkhour.find(params[:id])
    @planworkhour.destroy

    respond_to do |format|
      format.html { redirect_to(planworkhours_url) }
      format.xml  { head :ok }
    end
  end
end
