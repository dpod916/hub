Rails.application.routes.draw do
  resources :registrations
  resources :addresses
  resources :local_operating_units
  resources :legal_entities
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
