Rails.application.routes.draw do
  root to: 'years#index'

  get '/nebulas', to: 'nebulas#index'
  get '/nebulas/:id', to: 'nebulas#show', as: 'nebula'

  get '/nebulas/new', to: 'nebulas#new'
  post '/nebulas', to: 'nebulas#create'

  get '/nebulas/:id/edit', to: 'nebulas#edit'
  patch '/nebulas/:id/update', to: 'nebulas#update'

  delete 'nebulas/:id', to: 'nebulas#destroy', as: 'delete_nebula'

  get '/hugos', to: 'hugos#index'
  get '/hugos/:id', to: 'hugos#show', as: 'hugo'

  get '/hugos/new', to: 'hugos#new'
  post '/hugos', to: 'hugos#create'

  get '/hugos/:id/edit', to: 'hugos#edit'
  patch '/hugos/:id', to: 'hugos#update'

  delete '/hugos/:id', to: 'hugos#destroy', as: 'delete_hugo'

  get '/years', to: 'years#index'
  get '/years/:id', to: 'years#show', as: 'year'

  get '/years/new', to: 'years#new'
  post '/years', to: 'years#create'

  get '/years/:id/edit', to: 'years#edit'
  patch '/years/:id', to: 'years#update'

  delete '/years/:id', to: 'years#destroy', as: 'delete_year'

  get '/authors', to: 'authors#index'
  get '/authors/:id', to: 'authors#show', as: 'author'

  get '/authors/new', to: 'authors#new'
  post '/authors', to: 'authors#create'

  get '/authors/:id/edit', to: 'authors#edit'
  patch '/authors/:id', to: 'authors#update'

  delete '/authors/:id', to: 'authors#destroy', as: 'delete_author'

  get '/books', to: 'books#index'
  get '/books/:id', to: 'books#show', as: 'book'

  get '/books/new', to: 'books#new'
  post '/books', to: 'books#create'

  get '/books/:id/edit', to: 'books#edit'
  patch '/books/:id', to: 'books#update'

  delete '/books/:id', to: 'books#destroy', as: 'delete_book'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
