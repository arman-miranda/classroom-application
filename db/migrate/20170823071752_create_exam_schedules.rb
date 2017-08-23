class CreateExamSchedules < ActiveRecord::Migration[5.0]
  def change
    create_table :exam_schedules do |t|
      t.string :title
      t.text :details
      t.datetime :start_date
      t.datetime :end_date
      t.references :subject_assignment, foreign_key: true

      t.timestamps
    end
  end
end
