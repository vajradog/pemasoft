Pemasoft::Application.routes.draw do



devise_for :users#, :controllers => { :registrations => "registrations"}
resources :users, :controller => "users"
# MAKE SURE ABOUT THE ROUTES, USERS 
# SEE IF WE NEED REGISTRATIONS CONTROLLER
 
#resources :pages#, except: :show
#get ':id', to: 'pages#show', as: :page #figure out routing for this guy permalink

resources :tasks

  root 'jobs#index'
  resources :jobs do
    resources :candidates do
      member { post :vote }
      resources :comments, only: [:new, :create, :show]
    end
  end

  get 'search' => 'users#search'


  resources :pages, only: [:index, :new, :create]
  resources :pages, path: "", except: [:index, :new, :create]
  #get '*id', to: 'pages#show'

  #resources :candidates

  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
