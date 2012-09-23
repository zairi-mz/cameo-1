class Maintreport < ActiveRecord::Base
  
  belongs_to :maintenance
  
  accepts_nested_attributes_for :maintenance
  
end
