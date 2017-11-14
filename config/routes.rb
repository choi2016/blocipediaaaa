Rails.application.routes.draw do
  devise_for :users

  #we call the resources method and pass it a Symbol. This instructs 
  #Rails to create post routes for creating, updating, viewing, and 
  #deleting instances of Wiki
  resources :wikis

  #we remove get "welcome/index" because we've declared the 
  #index view as the root view. We also modify the about route 
  #to allow users to visit /about, rather than /welcome/about.
  get 'about' => 'welcome#about'

  root 'welcome#index'

  #create routes for new andd create actions
end
