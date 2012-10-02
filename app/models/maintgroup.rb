class Maintgroup < ActiveRecord::Base
  validates_uniqueness_of :shortname
  
  has_many    :mainthours
  has_many    :maintenance, :through => :mainthours
  
  has_many    :planworkhours
  has_many    :maintreports, :through => :planworkhours
  
  def short_name_name
     "#{short_name}    | #{name}"
  end
  
end
