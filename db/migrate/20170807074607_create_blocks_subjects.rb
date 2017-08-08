class CreateBlocksSubjects < ActiveRecord::Migration[5.0]
  def change
    create_table :blocks_subjects do |t|
      t.references :block, foreign_key: true
      t.references :subject, foreign_key: true

      t.timestamps
    end
  end
end
