Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  authenticate :user do
    resources :jobs, only: [ :index, :create ]
    resource :paydays, only: :create
  end
end
