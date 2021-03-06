class ComponentsController < ApplicationController
  
  filter_access_to :all
  # GET /components
  # GET /components.xml
  def index
    @components = Component.search(params[:search])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @components }
    end
  end

  # GET /components/1
  # GET /components/1.xml
  def show
    @component = Component.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @component }
      format.pdf { render :layout => false }
    end
  end

  def prt_eqpt_list
    @complist = Component.find(:all, :order => "component_code ASC")

    respond_to do |format|
      format.pdf { prawnto :prawn => {:page_layout => :landscape}, :inline => true, :margins => [0,0,0,0] 
                  render :action => "prt_eqpt_list" }
    end
  end
  
  # GET /components/new
  # GET /components/new.xml
  def new
    @component = Component.new(:parent_id => params[:parent_id])

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @component }
    end
  end

  # GET /components/1/edit
  def edit
    @component = Component.find(params[:id])
  end

  # POST /components
  # POST /components.xml
  def create
    @component = Component.new(params[:component])

    respond_to do |format|
      if @component.save
        flash[:notice] = 'Component was successfully created.'
        format.html { redirect_to(@component) }
        format.xml  { render :xml => @component, :status => :created, :location => @component }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @component.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /components/1
  # PUT /components/1.xml
  def update
    @component = Component.find(params[:id])

    respond_to do |format|
      if @component.update_attributes(params[:component])
        flash[:notice] = 'Component was successfully updated.'
        format.html { redirect_to(@component) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @component.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /components/1
  # DELETE /components/1.xml
  def destroy
    @component = Component.find(params[:id])
    @component.destroy

    respond_to do |format|
      format.html { redirect_to(components_url) }
      format.xml  { head :ok }
    end
  end
  
  def indextree
    @components = Component.search(params[:search])
  end
  
end
