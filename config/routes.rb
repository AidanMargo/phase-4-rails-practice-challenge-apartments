Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # Apartment Routes
  resources :apartments
  
  # Tenant Routes
  resources :tenants

  # Lease Routes
  resources :leases, only: [:index, :create, :destroy]
end
