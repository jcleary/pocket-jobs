Rails.application.routes.draw do
  devise_for :users

  root 'root#show' 

  devise_scope :user do
    authenticate :user do
      resources :jobs, only: [ :index, :create ]
      resource :paydays, only: :create
      get 'profiles', action: :index, controller: 'profiles'

      resources :users do
        resources :jobs, only: :index
        resources :bank_items, only: [ :index, :new, :create ]
      end
    end
  end
end
