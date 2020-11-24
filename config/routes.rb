Rails.application.routes.draw do

  resources :products do
    member do
     delete :delete_image_attachment
    end
  end
  #  remove tasks after debuging
  resources :tasks

  devise_for :users
  resources :users, :only => [:show, :edit, :update]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "products#index"

  resources :home, only: :index


end
