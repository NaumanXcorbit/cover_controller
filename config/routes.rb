Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :clients, only: [:index, :show, :create]
    end
  end
  root "clients#index"
  resources :clients
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
