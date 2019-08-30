Rails.application.routes.draw do
  devise_for :users

  root 'root#show' 

  devise_scope :user do
    authenticate :user do
      resources :jobs, only: [ :index, :create ]
      resources :users, only: :index do
        resource :paydays, only: :create
        resources :jobs, only: :index
        resources :bank_items, only: [ :index, :new, :create ]
        get 'payment_schedule', to: 'payment_schedule#show'
      end
    end
  end
end
