class Location < ActiveRecord::Base
  
  #Relationships
  has_ancestry
  has_many    :components
  belongs_to  :orgchart
  
  
  def tree_gelas
     if is_root?
       gls = ""
     else
       gls = "class=\"child-of-node-#{parent_id}\""
     end
     gls
  end
  
end