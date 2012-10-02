class Maintreport < ActiveRecord::Base
  
  belongs_to :maintenance
  accepts_nested_attributes_for :maintenance
  
  has_many    :planworkparts
  has_many    :parts, :through => :planworkparts
  accepts_nested_attributes_for :planworkparts, :reject_if => lambda { |a| a[:part_id].blank? }, :allow_destroy => true
  
  has_many    :planworktools
  has_many    :tools, :through => :planworktools
  accepts_nested_attributes_for :planworktools, :reject_if => lambda { |a| a[:tool_id].blank? }, :allow_destroy => true
  
  has_many    :planworkhours
  has_many    :maintgroups, :through => :planworkhours
  accepts_nested_attributes_for :planworkhours, :reject_if => lambda { |a| a[:maintgroup_id].blank? }, :allow_destroy => true
  
  validates_presence_of :done_date
end
