class CreateSpecializations < ActiveRecord::Migration[5.0]
  def change
    create_table :specializations do |t|
      t.references :teacher, foreign_key: true
      t.references :subject, foreign_key: true

      t.timestamps
    end
  end
end
