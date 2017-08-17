class AddStudentNoToStudent < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :student_no, :string
  end
end
