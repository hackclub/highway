Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "landing#index"
  resources :users
  get "/projects", to: "projects#index"
  get "/projects/:user/:project_name", to: "projects#show", as: :project

  get "/info", to: "info#show"

  get "/dashboard", to: "landing#dashboard", as: :dashboard
  get "/leaderboards", to: "landing#leaderboards", as: :leaderboards

  resources :admin, only: [] do
    collection do
      get "/dashboard", to: "admin#dashboard", as: :dashboard
    end
  end

  # otp auth + session
  # resources :sessions

  post "/signin", to: "sessions#create", as: :signin
  get "/auth/code/:code", to: "sessions#exchange_code", as: :exchange_code
  post "/rsvp", to: "rsvps#create", as: :rsvp

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  ## prize shit
  resources :prizes do
    member do
      post :add_to_box
    end
  end

  resources :user_prizes, only: [] do
    member do
      patch :claim
    end
  end

  get "/prize_box", to: "users#prize_box", as: :prize_box

  get "/starter-projects", to: "launchpad#show"
  get "/getting-started", to: redirect("/getting-started/overview")
  get "/getting-started/:page", to: "overview#show", as: "overview_page"

  get "/advanced/:page", to: "advanced#show", as: "advanced_page"
  get "/advanced/", to: redirect("/advanced/overview")

  get "/guides/:page", to: "guides#show", as: "guides_page"
  get "/guides/", to: redirect("/guides/overview")

  get "/events", to: "events#index"

  get "/schedule", to: "schedule#index"
end
