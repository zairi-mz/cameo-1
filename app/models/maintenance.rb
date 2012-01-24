class Maintenance < ActiveRecord::Base
  belongs_to  :component
  
  has_many    :maintparts
  has_many    :parts, :through => :maintparts
  accepts_nested_attributes_for :maintparts, :reject_if => lambda { |a| a[:part_id].blank? }, :allow_destroy => true 
  
  has_many    :mainttools
  has_many    :tools, :through => :mainttools
  accepts_nested_attributes_for :mainttools, :reject_if => lambda { |a| a[:tool_id].blank? }, :allow_destroy => true 
  
  has_many    :mainthours
  has_many    :maintgroups, :through => :mainthours
  accepts_nested_attributes_for :mainthours, :reject_if => lambda { |a| a[:maintgroup_id].blank? }, :allow_destroy => true
  
  
  
  
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
       [ "Years",   365]
      ]
      
  MAINT_LEVEL = [
       #  Displayed       stored in db
       [ "OLM", 1 ],
       [ "ILM", 2 ],
       [ "DLM", 3 ]
      ]
end
