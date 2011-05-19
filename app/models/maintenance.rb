class Maintenance < ActiveRecord::Base
  belongs_to  :component
  
  
  
  def isorter
    coid = component_id
    Component.find(:all, :select => "component_code_and_name", :conditions => {:id => coid}).map(&:component_code_and_name)
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
