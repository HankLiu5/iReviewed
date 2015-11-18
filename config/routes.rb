Rails.application.routes.draw do
  resources :books
  # set up the root
  root to: "books#index"
end
