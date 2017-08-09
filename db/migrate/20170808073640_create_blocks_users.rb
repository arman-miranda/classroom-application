class CreateBlocksUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :blocks_users do |t|
      t.references :block, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
