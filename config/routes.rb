Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :client do
    resources :products, only: [:index, :show]
    resource :cart, only: [:show]
    resources :cart_items, only: [:create, :destroy]
  end
end
