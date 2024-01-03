Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
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
    end
  end
  
  resources :clients do
    member do
      get 'search_client', to: 'clients#search_client'
    end
  end

end
