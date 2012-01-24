class Maintpart < ActiveRecord::Base
  belongs_to  :maintenance
  belongs_to  :part
end
