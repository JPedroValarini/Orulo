Rails.application.routes.draw do
  devise_for :users

  root 'home#index'
  
  resources :home, only: [:index]

  post 'favorite', to: 'home#favorite'
  delete 'favorites/:id', to: 'home#delete_favorite', as: 'delete_favorite'
end
