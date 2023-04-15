Rails.application.routes.draw do
  # get 'reservations/index'
  # get 'reservations/show'
  devise_for :users
  root to: "pages#home"
  resources :motos do
    resources :reservations, only: [:create, :new]
    resources :reviews, only: %i[new create index]
  end
  resources :reservations, only: [:index, :show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # resources :motos
  # Defines the root path route ("/")
  # root "articles#index"
end
