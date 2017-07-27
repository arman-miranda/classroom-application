class CreateBlocks < ActiveRecord::Migration[5.0]
  def change
    create_table :blocks do |t|
      t.string :name
      t.integer :year_level

      t.timestamps
    end
  end
end
