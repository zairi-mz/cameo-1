class Planworktool < ActiveRecord::Base
  belongs_to :maintreport
  belongs_to :tool
end
