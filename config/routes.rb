Rails.application.routes.draw do
  resources :books do
    # Nest notes inside books. Paths to notes resources will have book id in them.
    # The functions we need is create and destroy because we will put these into books#show.
    resources :notes, only: [:create, :destroy]
  end
  # set up the root
  root to: "books#index"
end
