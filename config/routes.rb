Rails.application.routes.draw do
  devise_for :users
  root "writes#index"
  get "/writes/random" => "writes#random"
  resources :writes do
    resources :comments, only: [:create]
  end
  resources :users, only: [:show]
end
