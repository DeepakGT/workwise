Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "home#index"

  resources :projects, only: [:index, :create]
  resources :jobs, only: [:index]

  resources :saved_items, only: [] do
    collection do
      post ':item_type/:item_id', action: :toggle
    end
  end

  resources :likes, only: [] do
    post :toggle_like_dislike, on: :collection
  end
  
end
