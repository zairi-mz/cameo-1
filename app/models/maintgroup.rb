class Maintgroup < ActiveRecord::Base
  validates_uniqueness_of :shortname
  
  has_many    :mainthours
  has_many    :maintenance, :through => :mainthours
end
