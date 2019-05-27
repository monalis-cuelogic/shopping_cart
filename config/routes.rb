Rails.application.routes.draw do
  get 'home/index'
  get 'home/welcome'
  #root 'home#index'
  root 'home#welcome'
  get 'brands/new'
  post 'brands/new', to: 'brands#create'
 

  get 'brands/show'
  post 'brands/show', to: 'home#search'

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
  post 'home/show_search'
 
  
  # get 'home/add_to_cart'
  get 'home/:id/add_to_cart', to: 'home#add_to_cart', as: 'add_to_cart'
  get 'home/cart'
  post 'home/cart', to: 'home#search'
  delete 'home/:id', to: 'home#remove_cart', as: 'cart_remove'
  get '*path' => redirect('/')

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
