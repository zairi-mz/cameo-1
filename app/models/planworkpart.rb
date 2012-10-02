class Planworkpart < ActiveRecord::Base
  belongs_to :maintreport
  belongs_to :part
  validates_presence_of :quantity
  validates_numericality_of :quantity
end
