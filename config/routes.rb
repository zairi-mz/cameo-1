ActionController::Routing::Routes.draw do |map|
  map.resources :counters

  map.resources :planworkhours

  map.resources :planworktools

  map.connect '/maintreports/new_up', :controller => 'maintreports', :action => 'new_up'
  map.connect '/maintreports/show_up', :controller => 'maintreports', :action => 'show_up'
  map.resources :maintreports

  map.resources :jobdescs

  map.resources :orgcharts

  map.resources :locations

  map.connect '/maintgroups/prt_group_list', :controller => 'maintgroups', :action => 'prt_group_list'
  map.resources :maintgroups

  map.connect '/maintenances/show_up', :controller => 'maintenances', :action => 'show_up'
  map.connect '/maintenances/edit_up', :controller => 'maintenances', :action => 'edit_up'
  map.connect '/maintenances/newunplan', :controller => 'maintenances', :action => 'newunplan'
  map.connect '/maintenances/index_up', :controller => 'maintenances', :action => 'index_up'
  map.connect '/maintenances/planner', :controller => 'maintenances', :action => 'planner'
  map.connect '/maintenances/planner_prt', :controller => 'maintenances', :action => 'planner_prt'
  map.resources :maintenances, :member => { :show_up => [:get, :post, :put] }
  map.resources :maintenances, :member => { :index_up => [:get] }
  map.resources :maintenances, :member => { :planner => [:get] }
  map.resources :maintenances

  map.resources :documents
  
  map.connect '/parts/prt_parts_list', :controller => 'parts', :action => 'prt_parts_list'
  map.resources :parts

  map.connect '/addresses/prt_group_list', :controller => 'addresses', :action => 'prt_add_list'
  map.resources :addresses

  map.connect '/tools/prt_tools_list', :controller => 'tools', :action => 'prt_tools_list'
  map.resources :tools
  
  map.connect '/components/prt_eqpt_list', :controller => 'components', :action => 'prt_eqpt_list'
  map.resources :components, :collection => { :indextree => :get }

  map.resources :roles

  
  
  map.logout '/logout', :controller => 'sessions',  :action => 'destroy'
  map.login '/login',   :controller => 'sessions',  :action => 'new'
  map.register '/register', :controller => 'users', :action => 'create'
  map.signup '/signup', :controller => 'users',     :action => 'new'
  
  map.resources :users

  map.resource :session

  
  
  map.about '/about', :controller => "pages", :action => 'about'
  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  map.root :controller => "pages", :action => 'home'

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
