Rails.application.routes.draw do
  resources :countries
  devise_for :users
  
  root 'home#index'
end
