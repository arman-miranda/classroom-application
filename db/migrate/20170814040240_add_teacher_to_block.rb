class AddTeacherToBlock < ActiveRecord::Migration[5.0]
  def change
    add_reference :blocks, :teacher, foreign_key: true
  end
end
