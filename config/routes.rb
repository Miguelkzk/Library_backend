Rails.application.routes.draw do
  # Rutas de autenticación
  post 'register', to: 'authentication#register'
  post 'login', to: 'authentication#login'

  resources :users, :books do
    member do
      get 'search_books', to: 'books#search_books'
      get 'show_copies', to: 'books#show_copies'
    end 
  end

  resources :bookcopies, :clients, :bookrentals do
    member do
      get 'info_rental', to: 'bookrentals#info_rental'
      post 'associate_copies', to: 'bookrentals#associate_copies'
      get 'search_rental', to: 'bookrentals#search_rental'
    end
  end
  
  resources :clients do
    member do
      get 'search_client', to: 'clients#search_client'
    end
  end
end
