authorization do
  
  role :administrator do
    has_permission_on :components,  :to => [:manage, :indextree, :prt_eqpt_list]
    has_permission_on [:addresses, :components, :documents, :maintenances, :maintreports, :parts, :roles, :tools, :users],  :to => [:manage]
    has_permission_on :maintenances,  :to => [:newunplan, :index_up, :edit_up, :show_up, :update_up, :planner, :planner_prt]
    has_permission_on :authorization_rules, :to => :read
    
  end
  
  role :viewer do
    has_permission_on [:addresses, :components, :documents, :maintenances, :maintreports, :parts, :roles, :tools, :users],  :to => :read
  end
    
  role :equipment_editor do
    has_permission_on :components,  :to => [:manage, :indextree]
  end
  
  role :maintenance_editor do
    has_permission_on :maintenances,  :to => [:index, :show, :new, :new_maintreport, :create, :edit, :update, :destroy]
  end
  
  role :parts_editor do
    has_permission_on [:parts, :tools],  :to => [:index, :show, :new, :create, :edit, :update, :destroy]
  end
  
  role :documents_manager do
    has_permission_on :documents,  :to => [:index, :show, :new, :create, :edit, :update, :destroy]
  end
  
  role :guest do
    has_permission_on :users, :to => [:new, :create]
  end
end

privileges do
  privilege :approve,:includes => [:read, :update]
  privilege :manage, :includes => [:create, :read, :update, :delete, :core]
  privilege :core,   :includes => [:read]
  privilege :read,   :includes => [:index, :show]
  privilege :create, :includes => :new
  privilege :update, :includes => :edit
  privilege :delete, :includes => :destroy
end