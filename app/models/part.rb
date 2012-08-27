class Part < ActiveRecord::Base
  belongs_to :manufacturedby, :class_name => 'Addresses', :foreign_key => 'manufacturer_id'
  belongs_to :suppliedby,     :class_name => 'Addresses', :foreign_key => 'supplier_id'
  
  has_many    :compparts
  has_many    :components, :through => :compparts
  
  has_many    :maintparts
  has_many    :maintenance, :through => :maintparts
  
  
  def part_code_name
     "#{part_code}    | #{name}"
  end
end
