Rails.application.routes.draw do
    resources :users
    resources :twots
    root 'twots#index'
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
