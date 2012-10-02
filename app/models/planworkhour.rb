class Planworkhour < ActiveRecord::Base
  belongs_to  :maintreport
  belongs_to  :maintgroup
  validates_presence_of :hours
  validates_numericality_of :hours
end
