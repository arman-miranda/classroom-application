class CreateSubjectsUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :subjects_users do |t|
      t.references :subject, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
