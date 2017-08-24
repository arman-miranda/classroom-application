Rails.application.routes.draw do
  default_url_options host: "localhost:3000"
 #devise_for :admin_users, {class_name: 'User' }.merge(ActiveAdmin::Devise.config)
  ActiveAdmin.routes(self)

  devise_for :users, controllers: { registrations: "registrations" }

  get ":student_no/:block", to: "students#index", param: :block, via: [:get], as: :block

  resources :students, path: '/:block', except: :index do
    collection do
      resources :subject_assignments do
        resources :announcements
        resources :exam_schedules
      end
    end
  end
  resources :teachers


  get "/teaching_loads", to: "teachers#index" do
  end
  
  devise_scope :user do
    root 'devise/sessions#new'
  end
  
end
