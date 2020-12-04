Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items
  resources :charges
  delete 'charge_can_works/:id', to: 'charge_can_works#destroy', as: 'charge_can_work'
  resources :charge_can_works
end
