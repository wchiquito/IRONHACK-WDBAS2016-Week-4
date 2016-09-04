Rails.application.routes.draw do
    get 'projects' => 'projects#index'
    get 'projects/new' => 'projects#new'
    post 'projects/create' => 'projects#create'
    resources :users
    resources :twots
    root 'twots#index'
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
