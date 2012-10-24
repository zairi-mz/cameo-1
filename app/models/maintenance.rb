class Maintenance < ActiveRecord::Base
  belongs_to  :component
  
  has_many    :maintparts, :dependent => :destroy
  belongs_to  :jobdesc
  belongs_to  :user,     :foreign_key => 'reported_by'
  
  has_many    :parts, :through => :maintparts
  accepts_nested_attributes_for :maintparts, :reject_if => lambda { |a| a[:part_id].blank? }, :allow_destroy => true 
  
  has_many    :mainttools
  has_many    :tools, :through => :mainttools
  accepts_nested_attributes_for :mainttools, :reject_if => lambda { |a| a[:tool_id].blank? }, :allow_destroy => true 
  
  has_many    :mainthours
  has_many    :maintgroups, :through => :mainthours
  accepts_nested_attributes_for :mainthours, :reject_if => lambda { |a| a[:maintgroup_id].blank? }, :allow_destroy => true
  
  has_many :maintreports, :dependent => :destroy
  
  validates_presence_of :code, :description
  validates_numericality_of :frequency, :only_integer => true, :allow_blank => true
 
  def isorter
    coid = component_id
    a = Component.find(:all, :order => :component_code, :select => "name", :conditions => {:id => coid}).map(&:name)
    b = Component.find(:all, :order => :component_code, :select => "component_code", :conditions => {:id => coid}).map(&:component_code)
     "#{b}    | #{a}"
  end
 
  def periodicity
    (Maintenance::FREQ_UNIT.find_all{|disp, value| value == frequency_unit }).map {|disp, value| disp}
  end
  
  def maint_team
    (Maintenance::MAINT_LEVEL.find_all{|disp, value| value == level }).map {|disp, value| disp}
  end
    
  FREQ_UNIT = [
       #  Displayed       stored in db
       [ "Days",    1  ],
       [ "Weeks",   7  ],
       [ "Months",  30 ],
       [ "Years",   365],
       [ "Hours",   2]
      ]
      
  MAINT_LEVEL = [
       #  Displayed       stored in db
       [ "OLM", 1 ],
       [ "ILM", 2 ],
       [ "DLM", 3 ]
      ]
  
    def action_group_details
      @ag = Maintgroup.find(:first, :conditions => ["id=?", action_group_id])
      if @ag.nil?
        "-"
      else
    	 "#{@ag.short_name}"
      end
    end

    def action_group_name
      @ag = Maintgroup.find(:first, :conditions => ["id=?", action_group_id])
      if @ag.nil?
        "-"
      else
    	 "#{@ag.short_name}  #{@ag.name}"
      end
    end
    
    def user_name
      if reported_by.blank?
        "-"
      else
       @r = User.find(:first, :conditions => ["id=?", reported_by])
    	 "#{@r.name}"
      end
    end
    
    def current_hours(cid)
       @t = 0
        @c = Counter.find(:all, :conditions => ["component_id=?", cid])
        for c in @c
          @t = @t + c.run_hours
        end
      current_hours = @t
    end
    
    def maintreport_status(mr)
       @m = Maintreport.find(:all, :conditions => ["maintenance_id=?", mr])
        if @m.empty?
           "-"
        else
           m = @m[0]
           case m.work_status
           when 1
             maintreport_status = "Completed"
           when 2
             maintreport_status = "Work in Progress"
           when 3
            maintreport_status = "Waiting for Parts"
           when 4
             maintreport_status = "Sent for Repair"
           end
        end
    end

    def find_report(pid)
      @m = Maintreport.find(:all, :conditions => ["maintenance_id=?", pid])
    end        
  
end

