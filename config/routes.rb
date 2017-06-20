Rails.application.routes.draw do
  
  resources :todos
  resources :sprints
  devise_for :admins
  devise_for :users
  # get "home" => "organizations#home" , as: :home
  # get "about" => "organizations#about" , as: :about
  # get "contact" => "organizations#contact" , as: :contact
  # get "allUser" => "organizations#allUser" 

  get "assign_user" => "todos#assign_todos"
  get "some" => "start#some" 
  get "setAdmin" => "start#setAdmin" 
  get "nouser" => "start#nouser" 
  


  resources :organizations
  # root 'organizations#index'

   root 'start#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
