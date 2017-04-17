Rails.application.routes.draw do


  # resources :contacts,  only: [:new, :create]

  # resources :users

  root to: 'years#index'
  resources :books
  resources :authors
  resources :years
  resources :awards

end
