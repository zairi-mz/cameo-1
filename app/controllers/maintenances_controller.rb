class MaintenancesController < ApplicationController
  
  filter_resource_access
  filter_access_to :newunplan, :index_up, :show_up, :attribute_check => false
   
  # GET /maintenances
  # GET /maintenances.xml
  def index
    @maintenances = Maintenance.find(:all, :conditions => ["work_type=?", 1])
    @maintenance_equipment = @maintenances.group_by { |t| t.isorter }

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @maintenances }
    end
  end

  def index_up
    @maintenances = Maintenance.find(:all, :conditions => ["work_type=?", 2])
    @maintenance_equipment = @maintenances.group_by { |t| t.isorter }

    respond_to do |format|
      format.html # index_up.html.erb
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

  def show_up
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

  def newunplan
    @maintenance = Maintenance.new(:component_id => params[:component_id])
   
    respond_to do |format|
      format.html # newunplan.html.erb
      format.xml  { render :xml => @maintenance }
    end
  end
    
  # GET /maintenances/1/edit
  def edit
    @maintenance = Maintenance.find(params[:id])
  end

  def edit_up
    @maintenance = Maintenance.find(params[:id])
  end
  
  # POST /maintenances
  # POST /maintenances.xml
  def create
    @maintenance = Maintenance.new(params[:maintenance])

    respond_to do |format|
      if @maintenance.save
        flash[:notice] = 'Maintenance was successfully created.'
         if params[:plan]
            format.html { render :action => "show" }
            format.xml  { render :xml => @maintenance, :status => :created, :location => @maintenance }
          elsif params[:unplan]
            format.html { render :action => "show_up" }
            format.xml  { render :xml => @maintenance, :status => :created, :location => @maintenance }
          end
      else
        if params[:plan]
          format.html { render :action => "new" }
          format.xml  { render :xml => @maintenance.errors, :status => :unprocessable_entity }
        elsif params[:unplan]
          format.html { render :action => "newunplan" }
          format.xml  { render :xml => @maintenance.errors, :status => :unprocessable_entity }
        end
      end
    end
  end

  # PUT /maintenances/1
  # PUT /maintenances/1.xml
  def update
    @maintenance = Maintenance.find(params[:id])
    
    respond_to do |format|
      if @maintenance.update_attributes(params[:maintenance])
        flash[:notice] = 'Maintenance was successfully updated.'
        if params[:plan]
          format.html { render :action => "show" }
          format.xml  { head :ok }
        elsif params[:unplan]
          format.html { render :action => "show_up" }
          format.xml  { head :ok }
        end
      else
        if params[:plan]
          format.html { render :action => "edit" }
          format.xml  { render :xml => @maintenance.errors, :status => :unprocessable_entity }
        elsif params[:unplan]
          format.html { render :action => "edit_up" }
          format.xml  { render :xml => @maintenance.errors, :status => :unprocessable_entity }
        end
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
