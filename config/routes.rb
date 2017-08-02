Rails.application.routes.draw do
 #devise_for :admin_users, {class_name: 'User' }.merge(ActiveAdmin::Devise.config)
  ActiveAdmin.routes(self)

  devise_for :users
  resources :subjects
  
  devise_scope :user do
    root 'devise/sessions#new'
  end
end
