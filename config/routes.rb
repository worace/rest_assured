Rails.application.routes.draw do
  namespace :admin do
    root :to => "shelters#index"
    resources :shelters
  end
end
