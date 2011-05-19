class Tool < ActiveRecord::Base
  belongs_to :manufacturedby, :class_name => 'Addresses', :foreign_key => 'manufacturer_id'
  belongs_to :suppliedby,     :class_name => 'Addresses', :foreign_key => 'supplier_id'
end
