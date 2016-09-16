Rails.application.routes.draw do
  
  resources :categories
  devise_for :users, controllers: {
        sessions: 'users/sessions'
      }


      get 'welcome/index'

resources :tickets do
  resources :comments

end

resources :users

# get 'get_user/:email', :to => 'users#get_user', as: :get_user

 get '/get_user/', to: 'users#get_user', as: 'get_user'


get 'check_email', :to => 'tickets#check_email'

get 'change_status/:id/:status', :to => 'tickets#change_status'
get 'block_user/:id/:status', :to => 'users#block_user'
get 'invite_user', :to => 'tickets#invite_user'
post 'send_invite', :to => 'tickets#send_invite'

root 'welcome#index'

#root 'category#index'
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
