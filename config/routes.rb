Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :layouts do
    resources :registered_items, only: :create
    resources :items, only: :create
  end
  resources :registered_items, only: %i[update destroy]

  resources :layouts do
    member do
      post :duplicate
    end
    # other routes
  end

end
