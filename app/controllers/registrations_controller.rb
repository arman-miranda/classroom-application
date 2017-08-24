class RegistrationsController < Devise::RegistrationsController
  def edit
    unless @user.student.nil?
      @student = @user.student
    end

    super
  end

  def update
    unless @user.student.nil?
      @student = @user.student
    end
    super
  end
  
  protected
  
  def after_inactive_sign_up_path_for(resource_or_scope)
    if @user.has_role?(:teacher)
      Teacher.find(@user.teacher.id).update_attribute(:advisory_block, find_block)
    elsif @user.has_role?(:student)
      Student.find(@user.student.id).blocks << find_block
    end
      root_path
  end

  private
  
  def find_block
    Block.find(params[:user][:temp_block])
  end
end
