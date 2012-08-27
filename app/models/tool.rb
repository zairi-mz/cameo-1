class Tool < ActiveRecord::Base
  belongs_to :manufacturedby, :class_name => 'Addresses', :foreign_key => 'manufacturer_id'
  belongs_to :suppliedby,     :class_name => 'Addresses', :foreign_key => 'supplier_id'
  
  validates_uniqueness_of :tool_code, :tool_no
  
  has_many    :mainttools
  has_many    :maintenance, :through => :mainttools
end
