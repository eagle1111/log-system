Rails.application.routes.draw do
  devise_for :users
  root "events#index"
  resources :events

  namespace :admin do
    resources :events
    resources :users
  end

  resource :user
end
