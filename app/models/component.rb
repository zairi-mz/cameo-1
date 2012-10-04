class Component < ActiveRecord::Base
  
  #Filters
  before_save :set_my_variables
  
  #Relationships
  has_ancestry
  
  
  #has_many    :subcomponent,    :class_name => 'Component', :foreign_key => 'parent_id'
  #belongs_to  :parent,          :class_name => 'Component', :foreign_key => 'parent_id'
  belongs_to  :manufacturedby,  :class_name => 'Address', :foreign_key => 'manufacturer_id'
  belongs_to  :suppliedby,      :class_name => 'Address', :foreign_key => 'supplier_id'
  belongs_to  :location
  has_many    :maintenances
  belongs_to  :editor,          :class_name => 'User',     :foreign_key => 'created_by'
  has_many    :compparts
  has_many    :counters
  
  has_many    :parts, :through => :compparts
  accepts_nested_attributes_for :compparts, :reject_if => lambda { |a| a[:part_id].blank? }, :allow_destroy => true 
  
  #Validations
  validates_uniqueness_of :component_code
  
  
  #Model Variables
  def set_my_variables
    if created_by == nil
      self.created_by	= User.current_user.id
    else
      self.edited_by	= User.current_user.id
    end
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
  
  
  def tree_gelas
     if is_root?
       gls = ""
     else
       gls = "class=\"child-of-node-#{parent_id}\""
     end
     gls
  end
  
  #checks for relationship then gets data from location.rb
  def location_details     #use this name in the show
    if location.blank?
      " - "
    else
      location.location_code_and_name  #new variable in location
    end
  end
 
 def counter_total
   @t = 0
    @c = Counter.find(:all, :conditions => ["component_id=?", id])
    for c in @c
      @t = @t + c.run_hours
    end
  counter_total = @t
 end
  
end
