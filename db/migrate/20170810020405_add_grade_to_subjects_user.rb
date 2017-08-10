class AddGradeToSubjectsUser < ActiveRecord::Migration[5.0]
  def change
    add_column :subjects_users, :grade, :integer
  end
end
