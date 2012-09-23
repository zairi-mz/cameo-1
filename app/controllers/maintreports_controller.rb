class MaintreportsController < ApplicationController
  # GET /maintreports
  # GET /maintreports.xml
  def index
    @maintreports = Maintreport.all

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

  # GET /maintreports/1/edit
  def edit
    @maintreport = Maintreport.find(params[:id])
  end

  # POST /maintreports
  # POST /maintreports.xml
  def create
    @maintreport = Maintreport.new(params[:maintreport])
    @maintenance = Maintenance.find(params[:maintreport][:maintenance_id])

    respond_to do |format|
      if @maintreport.save
        @maintenance.update_attribute(:last_date, @maintreport.done_date)
        @maintenance.update_attribute(:next_date, get_nextdate)
        format.html { redirect_to(@maintreport, :notice => 'Maintreport was successfully created.') }
        format.xml  { render :xml => @maintreport, :status => :created, :location => @maintreport }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @maintreport.errors, :status => :unprocessable_entity }
      end
    end
  end

  def get_nextdate
    @maintenance = Maintenance.find(params[:maintreport][:maintenance_id])
    unless @maintenance.last_date.nil?
      @freq = @maintenance.frequency
      @frequnit =  @maintenance.frequency_unit
      case @frequnit
         when 1
           @nextdate = @maintenance.last_date + @freq.day
         when 7
           @nextdate = @maintenance.last_date + @freq.week
         when 30
            @nextdate = @maintenance.last_date + @freq.month   
         when 365
           @nextdate = @maintenance.last_date + @freq.year
      end
    end
  end
  helper_method :get_nextdate
   
  # PUT /maintreports/1
  # PUT /maintreports/1.xml
  def update
    @maintreport = Maintreport.find(params[:id])

    respond_to do |format|
      if @maintreport.update_attributes(params[:maintreport])
        format.html { redirect_to(@maintreport, :notice => 'Maintreport was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @maintreport.errors, :status => :unprocessable_entity }
      end
    end
  end

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
