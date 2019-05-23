Rails.application.routes.draw do
  get 'home/index'
  get 'home/welcome'
  root 'home#index'
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
  put 'products:id', to: 'products#update'
  delete 'products/:id', to: 'products#destroy', as: 'products_delete'

  post 'home/welcome', to: 'home#search'
  get 'home/show_search'
 
  
  get 'home/add_to_cart'
  #post  'home/show_search', to: 'home#add_to_cart'
  get '*path' => redirect('/')

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
