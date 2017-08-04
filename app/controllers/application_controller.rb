class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!, 
    :configure_permitted_parameters, if: :devise_controller?

  def access_denied(exception)
    redirect_to users_path, alert: exception.message
  end
  
  def after_sign_in_path_for(resource_or_scope)
    if current_user.has_role? :admin
      admin_dashboard_path
    else
      new_subject_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :birthdate, :address])

  end

end
