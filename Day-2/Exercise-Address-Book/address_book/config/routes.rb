Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'contacts' => 'contacts#index'
  post 'contacts' => 'contacts#create'
  get 'contacts/new' => 'contacts#new', as: 'contact_new'
  get 'contacts/:id' => 'contacts#show', as: 'contact'
  root 'contacts#index'
end