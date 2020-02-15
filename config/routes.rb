Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'widgets#index'
  resources :widgets, only: [:index]

  resources :users, only: [:new, :create, :show, :edit, :update, :edit_passwords, :update_passwords] do
    get 'password', to: 'users#edit_passwords'
    patch 'password', to: 'users#update_passwords'
    resources :widgets, only: [:index, :new, :create]
  end

  get 'login', to:'auth#new'
  post 'login', to:'auth#create'
  delete 'logout', to:'auth#destroy'
  get 'forgot_password', to: 'auth#edit'
  put 'forgot_password', to: 'auth#update'
  get 'check_email', to: 'auth#check_email'
end
