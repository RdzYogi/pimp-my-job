Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :users do
    resources :jobs
  end
  resources :jobs, only: [] do
    resources :offers, only: %i[new create]
  end
end
