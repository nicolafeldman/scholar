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

  # match 'apply/:id/update_headline', to: 'apply#update_headline', via: 'patch'
  # match 'apply/:id/edit_headline', to: 'apply#edit_headline', via: 'get'

  match 'edit_apply_headline', to: 'headlines#edit_apply_headline', via: 'get'
  match 'update_apply_headline', to: 'headlines#update_apply_headline', via: 'patch'

  match 'edit_contact_headline', to: 'headlines#edit_contact_headline', via: 'get'
  match 'update_contact_headline', to: 'headlines#update_contact_headline', via: 'patch'

  match 'edit_courses_headline', to: 'headlines#edit_courses_headline', via: 'get'
  match 'update_courses_headline', to: 'headlines#update_courses_headline', via: 'patch'

  match 'edit_donates_headline', to: 'headlines#edit_donates_headline', via: 'get'
  match 'update_donates_headline', to: 'headlines#update_donates_headline', via: 'patch'

  match 'edit_enrichments_headline', to: 'headlines#edit_enrichments_headline', via: 'get'
  match 'update_enrichments_headline', to: 'headlines#update_enrichments_headline', via: 'patch'

  match 'edit_faqs_headline', to: 'headlines#edit_faqs_headline', via: 'get'
  match 'update_faqs_headline', to: 'headlines#update_faqs_headline', via: 'patch'

  match 'edit_histories_headline', to: 'headlines#edit_histories_headline', via: 'get'
  match 'update_histories_headline', to: 'headlines#update_histories_headline', via: 'patch'

  match 'edit_media_headline', to: 'headlines#edit_media_headline', via: 'get'
  match 'update_media_headline', to: 'headlines#update_media_headline', via: 'patch'

  match 'edit_press_headline', to: 'headlines#edit_press_headline', via: 'get'
  match 'update_press_headline', to: 'headlines#update_press_headline', via: 'patch'

  match 'edit_results_headline', to: 'headlines#edit_results_headline', via: 'get'
  match 'update_results_headline', to: 'headlines#update_results_headline', via: 'patch'

  match 'edit_staffs_headline', to: 'headlines#edit_staffs_headline', via: 'get'
  match 'update_staffs_headline', to: 'headlines#update_staffs_headline', via: 'patch'

  match 'edit_studies_headline', to: 'headlines#edit_studies_headline', via: 'get'
  match 'update_studies_headline', to: 'headlines#update_studies_headline', via: 'patch'

  match 'edit_volunteers_headline', to: 'headlines#edit_volunteers_headline', via: 'get'
  match 'update_volunteers_headline', to: 'headlines#update_volunteers_headline', via: 'patch'

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
