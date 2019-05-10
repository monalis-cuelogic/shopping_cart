Rails.application.routes.draw do
  get 'home/index'
  get 'home/welcome'
  root 'home#index'
  get 'brands/new'
  post 'brands/new', to: 'brands#create'
  get 'brands/show', to: 'brands#show'
  delete 'brands/:id', to: 'brands#destroy', as: 'brands_delete'
  devise_for :users, controllers: { sessions: 'users/sessions'}

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end


