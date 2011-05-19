class Maintenance < ActiveRecord::Base
  belongs_to  :component
  
  
  
  def isorter
    coid = component_id
    a = Component.find(:all, :order => :id, :select => "name", :conditions => {:id => coid}).map(&:name)
    b = Component.find(:all, :order => :id, :select => "component_code", :conditions => {:id => coid}).map(&:component_code)
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
