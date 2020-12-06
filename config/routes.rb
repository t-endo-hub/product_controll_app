Rails.application.routes.draw do
  devise_for :users
  root to: 'production_plan_on_charges#index'
  get 'production_plan_on_charges/:item_id/', to: 'production_plan_on_charges#edit', as: 'edit_production_plan_on_charge'
  resources :items
  resources :charges
  delete 'charge_can_works/:id', to: 'charge_can_works#destroy', as: 'charge_can_work'
  resources :charge_can_works
  resources :production_plan_on_charges
end
