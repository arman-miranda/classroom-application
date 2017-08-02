Rails.application.routes.draw do
  devise_for :admin_users, {class_name: 'User' }.merge(ActiveAdmin::Devise.config)
  ActiveAdmin.routes(self)

  devise_for :users
  resources  :users
  resources :subjects
  
  root 'subjects#show'
end
