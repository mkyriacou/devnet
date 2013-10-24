Devnet::Application.routes.draw do

  get '/'     => "sessions#index"
  # landing page and show all
  get '/apps' => "apps#index"

  get  '/apps/new'      => "apps#new",  as: 'new_app'
  post '/apps/create'   => "apps#create"
  get  '/apps/:id/show' => "apps#show", as: 'show_app'
  get  '/apps/:id/edit' => "apps#edit", as: 'edit_app'
  post  '/apps/:id/update' => "apps#update"
  delete  '/apps/:id/delete' => "apps#destroy"  

  #--------------------------- Nested routing
 
  get    '/apps/:id/feedbacks'            => "feedbacks#index" 
  get    '/apps/:id/feedbacks/new'        => "feedbacks#new"#, as: 'new_feedback'
  post   '/apps/:id/feedbacks/create'     => "feedbacks#create"
  get    '/apps/:id/feedbacks/:id/show'   => "feedbacks#show"#, as: 'show_feedback'
  get    '/apps/:id/feedbacks/:id/edit'   => "feedbacks#edit"
  post   '/apps/:id/feedbacks/:id/update' => "feedbacks#update"
  delete '/apps/:id/feedbacks/:id'        => "feedbacks#destroy"

  # -------------------------- Session routes

  resources :sessions, only: [:new, :create]
  get '/logout' => "sessions#destroy"


  # -------------------------- User routes

  resources :users

  # get  '/feedbacks'          => "feedbacks#index"
  # get  '/feedbacks/new'      => "feedbacks#new", as: 'new_feedback'
  # post '/feedbacks/create'   => "feedbacks#create"
  # get  '/feedbacks/:id/show' => "feedbacks#show", as: 'show_feedback'






  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
