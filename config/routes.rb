Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items
  resources :charges
  resources :charge_can_works
end
