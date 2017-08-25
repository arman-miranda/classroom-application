class CreateGrades < ActiveRecord::Migration[5.0]
  def change
    create_table :grades do |t|
      t.references :subject_grade, foreign_key: true
      t.string :source_name
      t.integer :score

      t.timestamps
    end
  end
end
