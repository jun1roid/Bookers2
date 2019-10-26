Rails.application.routes.draw do
  get 'home/about',"home#about"
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books
  resources :users
  root to: "home#index"
end