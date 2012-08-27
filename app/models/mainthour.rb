class Mainthour < ActiveRecord::Base
  belongs_to  :maintenance
  belongs_to  :maintgroup
end
