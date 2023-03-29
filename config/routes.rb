Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :motos

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :motos
  # Defines the root path route ("/")
  # root "articles#index"
end
