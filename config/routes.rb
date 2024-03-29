Rails.application.routes.draw do
  # [...]
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :board, only: [:index, :show, :create, :update, :destroy] do
        resources :posts, only: [:create]
      end
    end
  end
end
