Rails.application.routes.draw do
  resources :orders do  
    resources:orderitems
  end
  get 'static_pages/homecategory'

  resources :items
  resources :categories
  devise_for :users do  
    resources:orders
  end
  get '/checkout' => 'cart#createOrder'
  get '/paid' => 'static_pages#paid'
  get 'cart/index'
  root :controller => 'static_pages', :action => 'home'
  get 'static_pages/home'
  
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'

  get '/login' => 'user#user_login'
  get '/logout' => 'user#logout'

  get '/cart' => 'cart#index'
  get '/cart/clear' => 'cart#clearCart'
  get '/cart/:id' => 'cart#add'
  get '/cart/remove/:id' => 'cart#remove'
  
  
  post '/search' => 'items#search'
  get '/homecategory'=> 'static_pages#homecategory' 
  get '/homecategory/:title', to: 'static_pages#homecategory'
  get '/pcbuilder/:config', to: 'static_pages#pcbuilder'
  get '/cart/build/:config', to: 'cart#build'
  root 'site#home'


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
