Rails.application.routes.draw do
  devise_for :groups
  get 'welcome/index'
  
  devise_for :users, :controllers => { sign_up: 'registrations' }
  #devise_for :users, :controllers => { registration: 'registrations' }
  #devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :tasks

  resources :welcome, except: [:create, :update, :new, :edit, :show,:destroy]

  #root 'tasks#index'
  root 'welcome#index'
end
