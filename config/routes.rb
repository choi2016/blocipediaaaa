Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'

  get 'welcome/about'

  root 'welcome#index'

  #create routes for new andd create actions
  resources :users, only: [:new, :create]
end
