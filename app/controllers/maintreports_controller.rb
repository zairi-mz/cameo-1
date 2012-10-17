class MaintreportsController < ApplicationController
  # GET /maintreports
  # GET /maintreports.xml
  def index   
    @m = params[:maintenance_id]
    @maintreports = Maintreport.find(:all, :conditions => ["maintenance_id=?", @m], :order => "start_date DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @maintreports }
    end
  end

  # GET /maintreports/1
  # GET /maintreports/1.xml
  def show
    @maintreport = Maintreport.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @maintreport }
      format.pdf { render :layout => false }
    end
  end

  def show_up
    @m = params[:id]
    @maintreport = Maintreport.find(:all, :conditions => ["maintenance_id=?", @m])
    @maintreport = @maintreport[0]
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @maintreport }
      format.pdf { render :layout => false }
    end
  end
  
  # GET /maintreports/new
  # GET /maintreports/new.xml
  def new
    @maintreport = Maintreport.new
    @maintenance = Maintenance.find(params[:id])

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @maintreport }
    end
  end

  def new_up
    @maintreport = Maintreport.new
    @maintenance = Maintenance.find(params[:id])

    respond_to do |format|
      format.html # new_up.html.erb
      format.xml  { render :xml => @maintreport }
    end
  end

  # GET /maintreports/1/edit
  def edit
    @maintreport = Maintreport.find(params[:id])
     @m = params[:maintenance_id]
     @maintenance = Maintenance.find(:all, :conditions => ["id=?", @m])
     @maintenance = @maintenance[0]
  end

  def edit_up
   @maintreport = Maintreport.find(params[:id])
   @m = params[:maintenance_id]
   @maintenance = Maintenance.find(:all, :conditions => ["id=?", @m])
   @maintenance = @maintenance[0]
  end

  # POST /maintreports
  # POST /maintreports.xml
  def create
    @maintreport = Maintreport.new(params[:maintreport])
    @maintenance = Maintenance.find(params[:maintreport][:maintenance_id])
    
    respond_to do |format|
      if @maintreport.save
        update_partqty
        if params[:plan]
            update_next_date_hour
            format.html { render :action => "show" }
            format.xml  { render :xml => @maintreport, :status => :created, :location => @maintreport }
          elsif params[:unplan]
            update_work_status
            format.html { render :action => "show_up" }
            format.xml  { render :xml => @maintreport, :status => :created, :location => @maintreport }
          end
      else
        if params[:plan]
          format.html { render :action => "new" }
          format.xml  { render :xml => @maintreport.errors, :status => :unprocessable_entity }
        elsif params[:unplan]
          format.html { render :action => "new_up" }
          format.xml  { render :xml => @maintreport.errors, :status => :unprocessable_entity }
        end
      end
    end
  end

  def update_next_date_hour
    if !@maintreport.done_date.nil?
      @maintenance = Maintenance.find(params[:maintreport][:maintenance_id])
      @maintenance.update_attribute(:last_date, @maintreport.done_date)
      @maintenance.update_attribute(:last_hour, @maintreport.last_maintenance_hour)
      @freq = @maintenance.frequency
      @frequnit =  @maintenance.frequency_unit
      case @frequnit
        when 1
          @maintenance.update_attribute(:next_date, @maintenance.last_date + @freq.day)
        when 2
          @maintenance.update_attribute(:next_hour, @maintenance.last_hour + @freq)
        when 7
          @maintenance.update_attribute(:next_date, @maintenance.last_date + @freq.week)
        when 30
          @maintenance.update_attribute(:next_date, @maintenance.last_date + @freq.month)   
        when 365
          @maintenance.update_attribute(:next_date, @maintenance.last_date + @freq.year)
      end
    end
  end
  helper_method :update_next_date_hour
  
  def update_partqty
    if !@maintreport.done_date.nil?
  	  for parts in @maintreport.parts
  		  @m = @maintreport.id
  		  @p = parts.id
  		  @q = parts.quantity
  		  @pwpart = Planworkpart.find(:all, :conditions => ["maintreport_id=? and part_id=?", @m, @p])
  		  pwpart = @pwpart [0]
  		  @pq = @q - pwpart.quantity
  		  parts.update_attribute(:quantity, @pq)
  		end
  	end
  end
  helper_method :update_partqty
   
  # PUT /maintreports/1
  # PUT /maintreports/1.xml
  def update
    @maintreport = Maintreport.find(params[:id])
    @maintenance = Maintenance.find(params[:maintreport][:maintenance_id])
    respond_to do |format|
      if @maintreport.update_attributes(params[:maintreport])
        update_partqty
          if params[:plan]
              update_next_date_hour
              format.html { render :action => "show", :notice => 'Maintreport was successfully updated.' }
              format.xml  { render :xml => @maintreport, :status => :created, :location => @maintreport }
            elsif params[:unplan]
              update_work_status
              format.html { render :action => "show_up", :notice => 'Maintreport was successfully updated.' }
              format.xml  { render :xml => @maintreport, :status => :created, :location => @maintreport }
          end
        else
          if params[:plan]
            format.html { render :action => "edit" }
            format.xml  { render :xml => @maintreport.errors, :status => :unprocessable_entity }
          elsif params[:unplan]
            format.html { render :action => "edit_up" }
            format.xml  { render :xml => @maintreport.errors, :status => :unprocessable_entity }
          end
      end
    end
  end

  def update_work_status
    if !@maintreport.done_date.nil?
  	  @maintreport.update_attribute(:work_status, 1)
  	end
  	if @maintreport.work_status == 1
  	  @maintreport.update_attribute(:done_date, Time.now)
  	  @maintenance = Maintenance.find(params[:maintreport][:maintenance_id])
      @maintenance.update_attribute(:last_date, @maintreport.done_date)
  	end
  end
  helper_method :update_work_status
  
  # DELETE /maintreports/1
  # DELETE /maintreports/1.xml
  def destroy
    @maintreport = Maintreport.find(params[:id])
    @maintreport.destroy

    respond_to do |format|
      format.html { redirect_to(maintreports_url) }
      format.xml  { head :ok }
    end
  end
end
