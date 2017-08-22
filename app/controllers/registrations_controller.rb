class RegistrationsController < Devise::RegistrationsController
  def edit
    unless @user.student.nil?
      @student = @user.student
    end

    super
  end
  
  protected
  
  def after_inactive_sign_up_path_for(resource_or_scope)
    if @user.has_role?(:teacher)
      Teacher.find(@user.teacher.id).update_attribute(:advisory_block, find_block)
      edit_teacher_path(@user.teacher.id)
    elsif @user.has_role?(:student)
      Student.find(@user.student.id).blocks << find_block
      edit_student_path(@user.student.id)
    else
      root_path
    end
  end

  private
  
  def find_block
    Block.find(params[:user][:temp_block])
  end
end
