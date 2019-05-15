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

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
