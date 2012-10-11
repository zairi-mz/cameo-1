class Address < ActiveRecord::Base
  has_many :c_suppliers,      :class_name => 'Component', :foreign_key => 'supplier_id'
  has_many :c_manufacturers,  :class_name => 'Component', :foreign_key => 'manufacturer_id'
  has_many :t_suppliers,      :class_name => 'Tool',     :foreign_key => 'supplier_id'
  has_many :t_manufacturers,  :class_name => 'Tool',     :foreign_key => 'manufacturer_id'
  has_many :p_suppliers,      :class_name => 'Part',     :foreign_key => 'supplier_id'
  has_many :p_manufacturers,  :class_name => 'Part',     :foreign_key => 'manufacturer_id'
  has_many :suppliers,        :class_name => 'Maintreport', :foreign_key => 'supplier_id'
end
