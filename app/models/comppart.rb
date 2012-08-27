class Comppart < ActiveRecord::Base
  belongs_to  :component
  belongs_to  :part
  
end
