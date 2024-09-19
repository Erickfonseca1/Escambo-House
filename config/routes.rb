Rails.application.routes.draw do
  get "dashboard/index"
  devise_for :users

  # Define a rota principal após o login
  authenticated :user do
    root to: "dashboard#index", as: :authenticated_root
  end

  # Define a rota padrão para usuários não logados
  unauthenticated do
    root to: "home#index", as: :unauthenticated_root
  end

  resources :services, only: [ :index, :new, :create, :edit, :update, :destroy ]
  resources :exchanges, only: [ :index, :new, :create, :edit, :update, :destroy ]
  resources :marketplace_services, only: [ :index ]
end
