Rails.application.routes.draw do
  devise_for :users
 
  devise_scope :user do
    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end

    authenticate :user do
      root 'jobs#index', as: :authenticated_root
      resources :jobs, only: [ :index, :create ]
      resource :paydays, only: :create
      get 'profile', action: :show, controller: 'profiles'
      get 'profiles', action: :index, controller: 'profiles'

      resources :users do
        resources :jobs, only: :index
      end

      get 'profile/bank_items', action: :bank_items, controller: 'profiles'
    end
  end
end
