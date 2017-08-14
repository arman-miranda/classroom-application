class AddTeacherToSubjectAssignment < ActiveRecord::Migration[5.0]
  def change
    add_reference :subject_assignments, :teacher, foreign_key: true
  end
end
