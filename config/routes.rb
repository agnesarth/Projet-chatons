Rails.application.routes.draw do
  root to: 'items#index'
  devise_for :users

  resources :users,:carts,:items, :charges

  resources :users do
    resources :orders
  end
  
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'

  resources :items, only: [:new] do
    resources :photos, only: [:new, :create]
  end

  #resources :items do
    #post 'shopping#cart'
  #end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
