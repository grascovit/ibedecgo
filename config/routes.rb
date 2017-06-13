Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    resources :posts
    resources :users
  end
end
