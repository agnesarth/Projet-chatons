Rails.application.routes.draw do
  root to: 'items#index'
  devise_for :users

  resources :carts, :items
  
  resources :users, path: "mon_compte" do
    resources :orders, path: "mes_commandes"
  end
  
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'



end
