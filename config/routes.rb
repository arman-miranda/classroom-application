Rails.application.routes.draw do
  default_url_options host: "localhost:3000"
 #devise_for :admin_users, {class_name: 'User' }.merge(ActiveAdmin::Devise.config)
  ActiveAdmin.routes(self)

  devise_for :users, controllers: { registrations: "registrations" }

  resources :subjects
  resources :students, except: :index

  get ":student_no/:block", to: "students#index", as: :block, param: :block

  devise_scope :user do
    root 'devise/sessions#new'
  end
  
end
