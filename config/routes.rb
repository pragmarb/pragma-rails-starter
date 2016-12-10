Rails.application.routes.draw do
  devise_for :users
  namespace :api do
    namespace :v1 do
      resources :pings, only: %i(create)
    end
  end
end
