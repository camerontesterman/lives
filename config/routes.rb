Rails.application.routes.draw do
  resources :cities
  resources :countries
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
end
