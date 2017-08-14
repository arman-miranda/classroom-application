class AddBlockToSubject < ActiveRecord::Migration[5.0]
  def change
    add_reference :subjects, :block, foreign_key: true
  end
end
