Rails.application.routes.draw do
  devise_for :users
  root "events#index"
  resources :events

  namespace :admin do
    root "events#index"
    resources :events
    resources :users
    resources :groups
  end

  resource :user
end
