Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :pings, only: %i(create)
      resources :tokens, only: %i(create)
      resources :confirmations, only: %i(create) do
        member do
          post :complete
        end
      end
    end
  end
end
