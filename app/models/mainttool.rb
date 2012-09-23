class Mainttool < ActiveRecord::Base
  belongs_to  :maintenance
  belongs_to  :tool
end
