Rails.application.routes.draw do
  get 'about' => 'welcome#about'

  root 'welcome#index'
  
  resources :wikis
  resources :charges, only: [:new, :create]
  resources :downgrade, only: [:destroy]

  devise_for :users
end
