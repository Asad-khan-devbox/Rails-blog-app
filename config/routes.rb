Rails.application.routes.draw do
  root "pages#index"
  get "/about", to: "pages#about"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :articles
  get 'signup', to: "users#new"
  resources :users, except: [:new]
  get 'login', to: "sessions#new"
  post 'login', to: "sessions#create"
  delete 'logout', to: "sessions#destroy"
end
