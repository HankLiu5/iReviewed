Rails.application.routes.draw do

  resources :sessions, only: [:new, :create, :destroy]
  resources :books do
    # Nest notes inside books. Paths to notes resources will have book id in them.
    # The functions we need is create and destroy because we will put these into books#show.
    resources :notes, only: [:create, :destroy]
  end
  # set up the root
  root to: "books#index"

  # When I have a get request to a "/login" page, that should be interpreted as
  # something that should go to sessions controller new action.
  # And, in our application, we're going to refer to that as login.
  # As a result, we will have login_path or login_url.
  get "/login" => "sessions#new", as: "login"
  delete "/logout" => "sessions#destroy", as: "logout"
end
