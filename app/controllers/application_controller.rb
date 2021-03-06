class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user! 
  before_action :configure_permitted_parameters, if: :devise_controller?

  def access_denied(exception)
    redirect_to users_path, alert: exception.message
  end
  
  def after_sign_in_path_for(resource_or_scope)
    if current_user.has_role? :admin
      admin_dashboard_path
    elsif current_user.has_role? :student
      block_path(block: user_block, student_no: user_student_no)
    elsif current_user.has_role? :teacher
      teachers_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :birthdate, :address, :role_ids, :avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: [:avatar])

  end

  private 
  
  def user_block
    current_user.student.blocks.first.complete_block_name
  end

  def user_student_no
    current_user.student.student_no
  end

end
