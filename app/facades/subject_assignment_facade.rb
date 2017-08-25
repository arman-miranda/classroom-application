class SubjectAssignmentFacade
  attr_reader :subject_assignment

  def initialize(subject_assignment)
    @subject_assignment = subject_assignment
  end

  def id
    @subject_assignment.id
  end

  def subject_name
    @subject_name ||= @subject_assignment.subject.name
  end

  def subject_code
    @subject_code ||= @subject_assignment.subject.code
  end

  def teacher_image
    @teacher_image ||= @subject_assignment.teacher.user.avatar.url(:medium)
  end

  def teacher_name
    @teacher_name ||= @subject_assignment.teacher.teacher_name
    if @teacher.nil?
      return "No teacher assigned yet"
    else
      return @teacher
    end
  end

  def announcements
    @announcements ||= @subject_assignment.announcements.order(updated_at: :desc)
  end

  def announcement
    @announcement ||= @subject_assignment.announcements.new
  end

  def exam_schedules
    @exam_schedules ||= @subject_assignment.exam_schedules.order(updated_at: :desc)
  end

  def exam_schedule
    @exam_schedule ||= @subject_assignment.exam_schedules.new
  end
end
