class Component < ActiveRecord::Base
  
  #Filters
  before_save :set_my_variables
  
  #Relationships
  has_ancestry
  #has_many    :subcomponent,    :class_name => 'Component', :foreign_key => 'parent_id'
  #belongs_to  :parent,          :class_name => 'Component', :foreign_key => 'parent_id'
  belongs_to  :manufacturedby,  :class_name => 'Address', :foreign_key => 'manufacturer_id'
  belongs_to  :suppliedby,      :class_name => 'Address', :foreign_key => 'supplier_id'
  has_many    :maintenances
  belongs_to  :editor,          :class_name => 'User',     :foreign_key => 'created_by'
  
  #Validations
  validates_uniqueness_of :component_code
  
  
  #Model Variables
  def set_my_variables
    self.created_by	= User.current_user.id
  end
  
  #List construction for drop down lists.
  def component_code_and_name
    "#{component_code}    | #{name}"
  end


  #Search Box on Index Page
  def self.search(search)
    if search
      find(:all, :conditions => ['component_code ILIKE ? or name ILIKE ?', "%#{search}%","%#{search}%"], :order => :component_code)
    else
      find(:all, :order => :component_code)
    end
  end
end
