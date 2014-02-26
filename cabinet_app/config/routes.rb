Contacts::Application.routes.draw do

  resources :chatlines


  resources :locations


  devise_for :users, :controllers => {:omniauth_callbacks => 'omniauth_callbacks'}

  resources :contacts

  root to: 'locations#index'
  get '/locations/landing', to: 'locations#landing', as: 'landing'
  get '/locations/:id/share', to: 'locations#share', as: 'share'

  post '/chat', to: 'chatlines#create', as: 'chat'

  get '/autoUpdate', to: 'chatlines#autoUpdate', as: 'autoUpdate'
end
