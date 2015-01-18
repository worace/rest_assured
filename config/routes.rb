Rails.application.routes.draw do
  root :to => "shelters#index"

  post "/sms_listings" => "listings#sms"

  resources :shelters, :only => [:show, :index]

  namespace :admin do
    root :to => "shelters#index"
    resources :shelters do
      resources :availability_reports, :only => [:new, :create]
    end
  end
end
