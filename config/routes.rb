Rails.application.routes.draw do
  root to: 'items#index'
  devise_for :users

  resources :carts, :items

  resources :users, path: "mon_compte" do
    resources :orders, path: "mes_commandes"
  end

  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'

  resources :items, only: [:new] do
    resources :photos, only: [:new, :create]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
