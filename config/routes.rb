Rails.application.routes.draw do

  get 'users/new'

  get 'users/create'

  resources :contacts,  only: [:new, :create]

  # resources :years, only: [:index, :show, :new] #for example

  root to: 'years#index'

  # get '/authors', to: 'authors#sort_by_awards', as: 'award_authors'

  get '/years', to: 'years#index'
  get '/years/new', to: 'years#new'
  post '/years', to: 'years#create'
  get '/years/:id', to: 'years#show', as: 'year'
  get '/years/:id/edit', to: 'years#edit', as: 'edit_year'
  patch '/years/:id', to: 'years#update'
  delete '/years/:id', to: 'years#destroy', as: 'delete_year'

  get '/authors', to: 'authors#index'
  get '/authors/new', to: 'authors#new'
  post '/authors', to: 'authors#create'
  get '/authors/:id', to: 'authors#show', as: 'author'
  get '/authors/:id/edit', to: 'authors#edit', as: 'edit_author'
  patch '/authors/:id', to: 'authors#update'
  delete '/authors/:id', to: 'authors#destroy', as: 'delete_author'

  get '/books', to: 'books#index'
  get '/books/new', to: 'books#new'
  post '/books', to: 'books#create'
  get '/books/:id', to: 'books#show', as: 'book'
  get '/books/:id/edit', to: 'books#edit', as: 'edit_book'
  patch '/books/:id', to: 'books#update'
  delete '/books/:id', to: 'books#destroy', as: 'delete_book'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
