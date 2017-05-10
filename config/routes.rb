Rails.application.routes.draw do
  resources :bixis
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :geocoder
  root "bixis#index"
end
