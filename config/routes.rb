Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :doctors, only: [:index, :show, :create, :destroy, :update]  #qLimit the routes to only for specific actions
      resources :specifications do
        get 'doctors', to: 'doctors#by_specification'
      end
    end  
  end
      # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "home#index"
  root to: proc { [200, {}, ['{"message": "Welcome to the API"}']] }, via: :get

end
