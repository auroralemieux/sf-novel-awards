Rails.application.routes.draw do


  # resources :contacts,  only: [:new, :create]

  # resources :users

  root to: 'years#index'
  get '/books/addauthor/:id', to: 'books#addauthor', as: 'add_author'
  resources :books
  resources :authors
  resources :years
  resources :awards

end
