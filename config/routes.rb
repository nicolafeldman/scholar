Scholar::Application.routes.draw do
  get "attachments/new"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  root 'home_pages#show'

  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  resources :contact
  resources :apply
  resources :press
  resources :links, only: [:create, :destroy]
  resources :media

  resources :home_pages
  resources :courses
  resources :enrichments
  resources :faqs
  resources :donates
  resources :galleries
  resources :quotations
  resources :histories
  resources :results
  resources :staffs
  resources :studies
  resources :volunteers

  match '/signup', to: 'users#new', via: 'get'
  match '/signin', to: 'sessions#new', via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'

  match 'apply/:id/updatetext', to: 'apply#update_text', via: 'patch'
  match 'apply/:id/edittext', to: 'apply#edittext', via: 'get'

  match 'histories/:id/updatetext', to: 'histories#update_text', via: 'patch'
  match 'histories/:id/edittext', to: 'histories#edittext', via: 'get'

  match 'results/:id/updatetext', to: 'results#update_text', via: 'patch'
  match 'results/:id/edittext', to: 'results#edittext', via: 'get'

  match 'media/:id/updatevideo', to: 'media#update_video', via: 'patch'
  match 'media/:id/editvideo', to: 'media#editvideo', via: 'get'

  match 'press/:id/edit', to: 'press#update', via: 'patch'

  match 'donates/:id/edit_full', to: 'donates#edit_full', via: 'get'
  match 'donates/:id/edit_full', to: 'donates#update_full', via: 'patch'

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
