Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    root to: 'dashboard#index'

    resources :posts
    resources :users
  end
end
