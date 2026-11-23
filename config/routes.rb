Rails.application.routes.draw do
    resources :companies do
        resources :contacts
    end

    get "dashboard/contacts", to: "dashboard#contacts"
    root "dashboard#show"
end
