Rails.application.routes.draw do
  devise_for :users
  root "events#index"
  resources :events

  namespace :admin do
    root "events#index"
    resources :events do
      resources :tickets, :controller => "event_tickets"
      resources :departments, :controller => "event_departments"
      resources :jobs, :controller => "event_jobs"
    end
    resources :users
    resources :groups
  end

  resource :user
end
