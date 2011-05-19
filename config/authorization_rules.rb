authorization do
  
  role :administrator do
    has_permission_on [:addresses, :components, :documents, :maintenances, :parts, :roles, :tools, :users],  :to => [:index, :show, :new, :create, :edit, :update, :destroy]
    has_permission_on :authorization_rules, :to => :read
  end
  
  role :viewer do
    has_permission_on [:addresses, :components, :documents, :maintenances, :parts, :roles, :tools, :users],  :to => [:index, :show]
  end
    
  role :equipment_editor do
    has_permission_on :components,  :to => [:index, :show, :new, :create, :edit, :update, :destroy]
  end
  
  role :maintenance_editor do
    has_permission_on :maintenances,  :to => [:index, :show, :new, :create, :edit, :update, :destroy]
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