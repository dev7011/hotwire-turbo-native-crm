Rails.application.routes.draw do
    resources :companies

    root "dashboard#show"
end
