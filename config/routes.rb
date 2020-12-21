Rails.application.routes.draw do

  
  get 'watchlist', to: 'watchlist#index'
  get 'favorites/update'
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


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "products#index"

  get 'dashboard', to: 'dashboard#index'
  get 'dashboard/users'
  get 'dashboard/categories'


end
