# 레일스는 정의된 URL mappings를 사용합니다. 
# root 메서드(method)는 선택에 따라 root path / 로 정리해줍니다. ... root_path와 root_url이라는 두 루트(routes)가 있는데요. 이 둘의 차이점은, ...
# 레일스 튜토리얼에서는 redirect를 할 때 빼고 보통 _path를 쓰는 컨벤션을 따르지요. redirect는 _url을 쓸 겁니다. (왜냐하면 http 표준이 redirect한 후에 완전한 URL을 필요로 하기 때문입니다. 대개 브라우저에서 잘 작동합니다.)

# 루트(routes) 중 두번째. 

Rails.application.routes.draw do
  get 'users/new'

  get 'hello_moon/bla'

  get 'hello_moon/moa'

  get 'hello_moon/dea'

  get 'static_pages/home'

  # get 'static_pages/help'
  # get 'static_pages/about'
  # get 'static_pages/contact'
  get 'help' => 'static_pages#help'
  get 'about' => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  get 'signup' => 'users#new'
  
  resources :microposts
  resources :users

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'static_pages#home'

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
