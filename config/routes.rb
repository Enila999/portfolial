Rails.application.routes.draw do

  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :projects, only: [:new, :create, :edit, :update]
  resources :contacts, only: [:new, :create]
  resources :customers, param: :slug, path: "mes-projets"

  # Defines the root path route ("/")
  # root "posts#index"

  get "/a-propos", to: "pages#about", as: :about
  get "/contact", to: "pages#contact", as: :contact
  get "/politique-de-confidentialite", to: "pages#privacy", as: :privacy
  get "/mentions-legales", to: "pages#legal", as: :legal
end
