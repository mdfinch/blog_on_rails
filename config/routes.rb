Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # root path is set to show index page
  get("/", to: "posts#index") 

  resources :users, only: [:new, :create]

  resource :session, only: [:new, :create, :destroy]

  # configures all routes for posts
  resources :posts do
    resources :comments, only: [:create, :destroy]
  end
end
