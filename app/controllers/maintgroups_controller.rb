class MaintgroupsController < ApplicationController
 
  # GET /maintgroups
  # GET /maintgroups.xml
  def index
    @maintgroups = Maintgroup.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @maintgroups }
    end
  end

  # GET /maintgroups/1
  # GET /maintgroups/1.xml
  def show
    @maintgroup = Maintgroup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @maintgroup }
    end
  end

  def prt_group_list
    @grouplist = Maintgroup.find(:all, :order => "short_name ASC")

    respond_to do |format|
      format.pdf { prawnto :prawn => {:page_layout => :portrait}, :inline => true, :margins => [0,0,0,0] 
                  render :action => "prt_group_list" }
    end
  end
  
  # GET /maintgroups/new
  # GET /maintgroups/new.xml
  def new
    @maintgroup = Maintgroup.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @maintgroup }
    end
  end

  # GET /maintgroups/1/edit
  def edit
    @maintgroup = Maintgroup.find(params[:id])
  end

  # POST /maintgroups
  # POST /maintgroups.xml
  def create
    @maintgroup = Maintgroup.new(params[:maintgroup])

    respond_to do |format|
      if @maintgroup.save
        flash[:notice] = 'Maintgroup was successfully created.'
        format.html { redirect_to(@maintgroup) }
        format.xml  { render :xml => @maintgroup, :status => :created, :location => @maintgroup }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @maintgroup.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /maintgroups/1
  # PUT /maintgroups/1.xml
  def update
    @maintgroup = Maintgroup.find(params[:id])

    respond_to do |format|
      if @maintgroup.update_attributes(params[:maintgroup])
        flash[:notice] = 'Maintgroup was successfully updated.'
        format.html { redirect_to(@maintgroup) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @maintgroup.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /maintgroups/1
  # DELETE /maintgroups/1.xml
  def destroy
    @maintgroup = Maintgroup.find(params[:id])
    @maintgroup.destroy

    respond_to do |format|
      format.html { redirect_to(maintgroups_url) }
      format.xml  { head :ok }
    end
  end
end
