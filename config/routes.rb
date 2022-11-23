Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get '/dashboard', to: 'jobs#dashboard'
  resources :jobs, only: %i[index show new create edit update destroy] do
    resources :offers, only: %i[new create]
  end
  resources :offers, only: %i[destroy]
end
