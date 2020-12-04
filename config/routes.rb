Rails.application.routes.draw do
  root to: "repositories#index"

  resources :repositories, only: %I[show]
end
