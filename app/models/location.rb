class Location < ActiveRecord::Base
  
  #Relationships
  has_ancestry
  has_many    :components
  has_many    :parts
  has_many    :tools
  belongs_to  :orgchart
  
  def location_code_and_name
      "#{code} | #{name}"
    end
  
  def tree_gelas
     if is_root?
       gls = ""
     else
       gls = "class=\"child-of-node-#{parent_id}\""
     end
     gls
  end
  
end
