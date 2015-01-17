Rails.application.routes.draw do
  namespace :admin do
    root :to => "shelters#index"
    resources :shelters do
      resources :availability_reports, :only => [:new, :create]
    end
  end
end
