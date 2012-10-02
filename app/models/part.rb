class Part < ActiveRecord::Base
  belongs_to :manufacturedby, :class_name => 'Addresses', :foreign_key => 'manufacturer_id'
  belongs_to :suppliedby,     :class_name => 'Addresses', :foreign_key => 'supplier_id'
  belongs_to  :location
  
  has_many    :compparts
  has_many    :components, :through => :compparts
  
  has_many    :maintparts
  has_many    :maintenance, :through => :maintparts
  
  has_many    :planworkparts
  has_many    :maintreport, :through => :planworkparts
  
  def part_code_name
     "#{part_code}    | #{name}                   | #{quantity}"
  end
  
  def supplier_name(sid)
    if sid.blank?
         " - "
    else
      @a = sid
      @s = Address.find(:all, :conditions => ["id=?", @a])
        s = @s [0]
  		  supplier_name = s.company
  	end
  end
  
  def location_details     #use this name in the show
    if location.blank?
      " - "
    else
      location.location_code_and_name  #new variable in location
    end
  end
    
end
