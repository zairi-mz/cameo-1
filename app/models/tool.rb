class Tool < ActiveRecord::Base
  belongs_to :manufacturedby, :class_name => 'Addresses', :foreign_key => 'manufacturer_id'
  belongs_to :suppliedby,     :class_name => 'Addresses', :foreign_key => 'supplier_id'
  belongs_to  :location
  
  validates_presence_of :tool_code, :name
  validates_uniqueness_of :tool_code, :tool_no
  
  has_many    :mainttools
  has_many    :maintenance, :through => :mainttools
  
  has_many    :planworktools
  has_many    :maintreport, :through => :planworktools
  
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
