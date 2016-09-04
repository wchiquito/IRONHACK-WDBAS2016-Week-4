Rails.application.routes.draw do
  get 'bids/create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'users' => 'users#index'
  post 'users' => 'users#create'
  get 'users/new' => 'users#new', as: 'user_new'
  get 'users/:id/edit' => 'users#edit', as: 'user_edit'
  get 'users/:id' => 'users#show', as: 'user'
  put 'users/:id' => 'users#update'
  patch 'users/:id' => 'users#update'
  delete 'users/:id' => 'users#destroy'

  get 'products' => 'products#index'
  post 'products' => 'products#create'
  get 'products/new' => 'products#new', as: 'product_new'
  get 'products/:id/edit' => 'products#edit', as: 'product_edit'
  get 'products/:id' => 'products#show', as: 'product'
  put 'products/:id' => 'products#update'
  patch 'products/:id' => 'products#update'
  delete 'products/:id' => 'products#destroy'

  get 'bids' => 'bids#index'
  post 'bids' => 'bids#create'
  get 'bids/new' => 'bids#new', as: 'bid_new'
  get 'bids/:id/edit' => 'bids#edit', as: 'bid_edit'
  get 'bids/:id' => 'bids#show', as: 'bid'
  put 'bids/:id' => 'bids#update'
  patch 'bids/:id' => 'bids#update'
  delete 'bids/:id' => 'bids#destroy'

  root 'users#index'
end
