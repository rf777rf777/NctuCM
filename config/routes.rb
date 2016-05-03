Rails.application.routes.draw do
  #get 'posts/new'

  #get 'posts/create'

  #get 'sessions/new'

  #get 'sessions/create'

  #get 'sessions/destroy'

  #get 'root/home'

#get post delete 為HTTP方法
  resources :users do #設定follow與unfollow路徑
    get 'followers', on: :member
    get 'followings', on: :member
    post 'follow', on: :member  #建立一個follow路徑 這個路徑適用於單獨/特定的用戶上
    delete 'unfollow' ,on: :member  #
  end
 
  resources :posts


  # :session 這個資源只有三個actions : new create destroy
  resource :session, only: [ :new, :create, :destroy ]

  #Rails.env.development? 的意思是 如果我們在開發(Development)環境裡 我們只會設定這個路徑
  get '/sandbox', to: 'root#sandbox' if Rails.env.development?

  #This maps / to the root#home action
  root to: 'root#home'
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
