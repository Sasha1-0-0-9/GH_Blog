Rails.application.routes.draw do
  get 'signup', to: 'authors#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :authors, only: %i[new create] do
    get :profile, on: :collection
    patch :save_profile, on: :collection
  end

  resources :authors
  resources :sessions
  get 'sessions/new'
  resources :posts do
    resources :comments do
      member do
        post :publish
      end
    end
  end
  root 'posts#index'
end
