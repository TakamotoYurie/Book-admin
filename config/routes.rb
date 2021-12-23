Rails.application.routes.draw do
  resources :books, only: %i{show destroy}
  resources :publishers
  resource :profile, only: %i{show edit update}
end
