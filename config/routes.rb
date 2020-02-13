Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'widgets#index'
  resource :widgets, only: [:index]


  get 'login', to:'auth#index'
  post 'login', to:'auth#create'
  get 'forgot_password', to:'auth#edit'
  post 'forgot_password', to: 'auth#update'
  delete 'logout', to:'auth#edit'
end
