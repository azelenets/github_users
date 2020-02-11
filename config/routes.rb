Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users

  authenticated :user do
    devise_scope :user do
      root to: 'search_users#new', as: :authenticated_root

      resource :search_users, only: %i[show]
    end
  end

  root to: 'home#index'
end
