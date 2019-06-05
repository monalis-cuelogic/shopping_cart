Rails.application.routes.draw do
  get 'home/index'
  get 'home/welcome'
  #root 'home#index'
  root 'home#welcome'
  get 'brands/new'
  post 'brands/new', to: 'brands#create'

  get 'brands/show'
  
  get 'brands/:id/edit', to: 'brands#edit', as: 'brands_edit'
  put 'brands/:id', to: 'brands#update'

  delete 'brands/:id', to: 'brands#destroy', as: 'brands_delete'
  devise_for :users, controllers: { sessions: 'users/sessions'}

  get 'products/new'
  post 'products/new', to: 'products#create'
  get 'products/show'
  get 'products/:id/edit', to: 'products#edit', as: 'products_edit'
  put 'products/:id', to: 'products#update'
  delete 'products/:id', to: 'products#destroy', as: 'products_delete'

  post 'home/welcome', to: 'home#search'
  get 'home/show_search'
  post 'home/show_search'
 
  #get 'home/add_to_cart'
  get 'home/:id/add_to_cart', to: 'home#add_to_cart', as: 'add_to_cart'
  get 'home/cart'
  post 'home/cart', to: 'home#search'
  delete 'home/:id', to: 'home#remove_cart', as: 'cart_remove'
  #get 'home/show_search', to: 'home#buy_product'
  #get 'home/buy_product'
  get 'home/:id/buy_product', to: 'home#buy_product', as: 'buy_product'
  get 'home/:id/welcome', to: 'home#buy_product'
  #get 'home/continue_order'
  post 'home/continue_order', to: 'home#continue_order'
  #post 'home/buy_product', 

  get "home/send_mail", to: 'home#send_mail'
  get "home/:id/send_mail", to: 'home#send_mail'
  get "home/:total/send_mail", to: 'home#send_mail'
  get "home/:quantity/send_mail", to: 'home#send_mail'
  #get '*path' => redirect('/')

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end