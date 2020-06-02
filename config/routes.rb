Rails.application.routes.draw do
  root to: 'items#index'
  devise_for :users

  resources :users,:orders,:carts,:items, :charges

  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
