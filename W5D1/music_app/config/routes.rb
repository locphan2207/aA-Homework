Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: 'sessions#new'
  resources :users, only: [:create, :new]
  resource :session, only: [:create, :new, :destroy]
  
  resources :bands do
    resources :albums, only: [:new]
  end
  
  resources :albums, except: [:new, :index] do 
    resources :tracks, only: [:new]
  end
  
  resources :tracks, except: [:new, :index]
  
  # post '/tracks/:id', to: 'notes#create'
  resources :notes, only: [:create, :destroy]
end
