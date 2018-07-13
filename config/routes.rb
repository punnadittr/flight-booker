Rails.application.routes.draw do
  get 'bookings/new'
  post 'bookings/create'
  get 'bookings/show'
  root 'flights#index'
  get 'flights/index'
  get 'search', to: 'flights#index'
  resources :bookings
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
