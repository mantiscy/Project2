Contacts::Application.routes.draw do

  resources :locations


  devise_for :users, :controllers => {:omniauth_callbacks => 'omniauth_callbacks'}

  resources :contacts

  root to: 'locations#index'
  get '/locations/landing', to: 'locations#landing', as: 'landing'
end
