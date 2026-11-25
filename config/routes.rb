Rails.application.routes.draw do
    resources :deals

    resources :companies do
        resources :contacts
    end

    get "dashboard/contacts", to: "dashboard#contacts"
    root "dashboard#show"
end
