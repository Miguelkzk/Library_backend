Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users, :books do
    member do
      get 'show_copies', to: 'books#show_copies'
    end 
end

  resources :bookcopies, :bookrentals do
    member do
      get 'book_copies', to: 'bookrentals#book_copies'
      post 'associate_copies', to: 'bookrentals#associate_copies'
    end
  end
end
