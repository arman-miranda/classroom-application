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
      new_student = Student.find(@user.student.id)
      new_student.blocks << find_block
      new_student.subjects.each do |subject|
        new_student.subject_grades.create!(subject: subject)
      end 
    end
      root_path
  end

  private
  
  def find_block
    Block.find(params[:user][:temp_block])
  end

end
