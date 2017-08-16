class RegistrationsController < Devise::RegistrationsController
  protected
  
  def after_inactive_sign_up_path_for(resource_or_scope)
    Student.find(@user.student.id).blocks << find_block
    edit_student_path(@user.student.id)
  end

  private
  
  def find_block
    Block.find(params[:user][:temp_block])
  end
end
