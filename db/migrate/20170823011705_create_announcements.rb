class CreateAnnouncements < ActiveRecord::Migration[5.0]
  def change
    create_table :announcements do |t|
      t.references :subject_assignment, foreign_key: true
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
