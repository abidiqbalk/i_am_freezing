Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :readings, only: [:create,:show] do
        collection do
          get :stats
        end
      end

    end
  end
end
