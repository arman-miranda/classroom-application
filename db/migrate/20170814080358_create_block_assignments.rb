class CreateBlockAssignments < ActiveRecord::Migration[5.0]
  def change
    create_table :block_assignments do |t|
      t.references :student, foreign_key: true
      t.references :block, foreign_key: true

      t.timestamps
    end
  end
end
