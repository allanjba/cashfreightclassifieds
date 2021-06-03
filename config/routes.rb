Rails.application.routes.draw do

  # static Pages
  get 'pages/index'
  get 'help', to: 'pages#help'
  get 'how-to-buy', to: 'pages#how_to_buy'
  get 'how-to-sell', to: 'pages#how_to_sell'

  get 'my-watchlist', to: 'watchlist#index'
  get 'my-listings', to: 'mylistings#index'
  get 'favorites/update'
  resources :bids
  resources :categories
  resources :products do
    member do
     delete :delete_image_attachment
    end
  end
  #  remove tasks after debuging
  resources :tasks

  devise_for :users
  resources :users, :only => [:show, :edit, :update, :destroy]
  get 'my-account', to: 'users#my_account'

  resources :conversations do
    resources :messages 
  end
  get '/conversations/read/:id', to: 'conversations#read'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "products#index"

  get 'dashboard', to: 'dashboard#index'
  get 'dashboard/users'
  get 'dashboard/categories'
  
  get '/notifications/read/:id', to: 'notifications#read'
  get '/notifications/nav-show', to: 'notifications#nav_show'
  mount ActionCable.server, at: '/cable'

end
