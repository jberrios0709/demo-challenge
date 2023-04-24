Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  post '/logout', to: 'sessions#destroy'

  resources :users, only: [:new, :create]

  scope :system do
    get '/upload_file', to: 'csv_files#new'
    get '/upload_file/header', to: 'csv_files#header'
    post '/upload_file', to: 'csv_files#create'

    resources :files, only: [:index]
    resources :contacts, only: [:index]
    resources :error_logs, only: [:index]
  end
end
