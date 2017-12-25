Rails.application.routes.draw do
  get 'collaborators/create'

  get 'collaborators/destroy'

  resources :wikis do
    resources :collaborators, only: [:create, :destroy]
  end

  resources :charges, only: [:new, :create]
  resources :downgrade, only: [:destroy]

  devise_for :users
  get 'about' => 'welcome#about'

  root 'welcome#index'

end
