Rails.application.routes.draw do
  get 'about', to: 'static_pages#about'
  get 'booklets', to: 'static_pages#booklets'
  get 'contact', to: 'static_pages#contact'
  get 'expertise', to: 'static_pages#expertise'
  get 'home', to: 'static_pages#home'
  get 'judgements', to: 'static_pages#judgements'
  get 'news', to: 'static_pages#news'
  get 'videos', to: 'static_pages#videos'

  root to: 'static_pages#home'

  devise_for :users

  resources :posts, only: [:show]

  namespace :admin do
    resources :booklets
    resources :judgements
    resources :posts
    resources :users

    root to: 'dashboard#index'
  end
end
