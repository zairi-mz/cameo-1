class MaintenancesController < ApplicationController
  
  filter_resource_access
  filter_access_to :newunplan, :index_up, :show_up, :attribute_check => false
   
  # GET /maintenances
  # GET /maintenances.xml
  def index
    search_maint(params[:search])
    @maintenance_equipment = $maintfound.group_by { |t| t.isorter }

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @maintenances }
    end
  end

  def index_up
    search_unplan(params[:search])
    @maintenance_equipment = $upmaintfound.group_by { |t| t.isorter }  

    respond_to do |format|
      format.html { render :action => "index_up" }
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
  
  def eqpt_hours(cid)
     @t = 0
      @c = Counter.find(:all, :conditions => ["component_id=?", cid])
      for c in @c
        @t = @t + c.run_hours
      end
    eqpt_hours = @t
  end
 
  def search_maint(search)
    $maintfound = []
    @maintdatedue =[]
    if search
      case search
        when "1"
          $maintfound = Maintenance.find(:all, :conditions => ["work_type=?", 1])
        when "2"
            @maintdatedue = Maintenance.find(:all, :conditions => ['next_date<? and work_type=?', Time.now, 1])
            @mainthourdue = []
            @maint = []
            @maint = Maintenance.find(:all, :conditions => ["frequency_unit=?", 2])
              for maint in @maint
          	    @mainthourdue += Maintenance.find(:all, :conditions => ["id=? and next_hour<?", maint.id, eqpt_hours(maint.component_id)])
              end
            $maintfound = @maintdatedue + @mainthourdue
        when "3"
            @maint = []
            @maintrpt =[]
            @maint = Maintenance.find(:all, :conditions => ["work_type=?", 1])
            for maint in @maint
            	@maintrpt = Maintreport.find(:all, :conditions => ["maintenance_id=? and done_date IS NULL", maint.id])
            	for maintrpt in @maintrpt
                if !maintrpt.nil?
                  $maintfound += Maintenance.find(:all, :conditions => ["id=?", maintrpt.maintenance_id])
                end
              end
            end            
      end
    else
      $maintfound = Maintenance.find(:all, :conditions => ["work_type=?", 1])
    end
  end
  
  def search_unplan(search)
    $upmaintfound = []
    if search
      case search
        when "1"
          $upmaintfound = Maintenance.find(:all, :conditions => ["work_type=?", 2])         
        when "2"
          $upmaintfound = Maintenance.find(:all, :conditions => ["date_to_finish<? and last_date IS NULL", Time.now])
        when "3"
          search_by_status(1)
        when "4"
          search_by_status(2)
        when "5"
          search_by_status(3)
        when "6"
          search_by_status(4)
      end
    else
      $upmaintfound = Maintenance.find(:all, :conditions => ["work_type=?", 2])
    end
  end
  
  def search_by_status(stat)
    @maint = []
    @maint = Maintenance.find(:all, :conditions => ["work_type=?", 2])
      for maint in @maint
        @maintrpt = Maintreport.find(:all, :conditions => ["maintenance_id=? and work_status=?", maint.id,stat])
        for maintrpt in @maintrpt
          if !maintrpt.nil?
            $upmaintfound += Maintenance.find(:all, :conditions => ["id=?", maintrpt.maintenance_id])
          end
        end
      end
  end
  
end
