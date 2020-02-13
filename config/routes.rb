Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'widgets#index'
  resources :widgets, only: [:index]

  resources :users, only: [] do
    resources :widgets, only: [:index]
  end

  get 'login', to:'auth#new'
  post 'login', to:'auth#create'
  delete 'logout', to:'auth#destroy'
end
