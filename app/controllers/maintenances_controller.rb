class MaintenancesController < ApplicationController
  
  filter_resource_access

     def get_nextdate
       @maintenance = Maintenance.find(params[:id])
       unless @maintenance.first_date.nil?
         @freq = @maintenance.frequency
         @frequnit =  @maintenance.frequency_unit
         case @frequnit
            when 1
              @nextdate = @maintenance.first_date + @freq.day
            when 7
              @nextdate = @maintenance.first_date + @freq.week
            when 30
               @nextdate = @maintenance.first_date + @freq.month   
            when 365
              @nextdate = @maintenance.first_date + @freq.year
         end
       end
     end
     helper_method :get_nextdate
   
  # GET /maintenances
  # GET /maintenances.xml
  def index
    @maintenances = Maintenance.all
    @maintenance_equipment = @maintenances.group_by { |t| t.isorter }

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @maintenances }
    end
  end

  # GET /maintenances/1
  # GET /maintenances/1.xml
  def show
    @maintenance = Maintenance.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @maintenance }
      format.pdf { render :layout => false }
    end
  end
  
  # GET /maintenances/new
  # GET /maintenances/new.xml
  def new
    @maintenance = Maintenance.new(:component_id => params[:component_id])
   
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @maintenance }
    end
  end

  # GET /maintenances/1/edit
  def edit
    @maintenance = Maintenance.find(params[:id])
  end

  # POST /maintenances
  # POST /maintenances.xml
  def create
    @maintenance = Maintenance.new(params[:maintenance])

    respond_to do |format|
      if @maintenance.save
        @maintenance.update_attribute(:next_date, get_nextdate)
        flash[:notice] = 'Maintenance was successfully created.'
        format.html { redirect_to(@maintenance) }
        format.xml  { render :xml => @maintenance, :status => :created, :location => @maintenance }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @maintenance.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /maintenances/1
  # PUT /maintenances/1.xml
  def update
    @maintenance = Maintenance.find(params[:id])
    
    respond_to do |format|
      if @maintenance.update_attributes(params[:maintenance])
        @maintenance.update_attribute(:next_date, get_nextdate)
        flash[:notice] = 'Maintenance was successfully updated.'
        format.html { redirect_to(@maintenance) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @maintenance.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /maintenances/1
  # DELETE /maintenances/1.xml
  def destroy
    @maintenance = Maintenance.find(params[:id])
    @maintenance.destroy

    respond_to do |format|
      format.html { redirect_to(maintenances_url) }
      format.xml  { head :ok }
    end
  end
  
end
