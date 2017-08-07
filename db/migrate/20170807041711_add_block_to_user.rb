class AddBlockToUser < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :block, foreign_key: true
  end
end
