Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    resources :judgements
    resources :posts
    resources :users

    root to: 'dashboard#index'
  end
end
