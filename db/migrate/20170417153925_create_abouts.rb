class CreateAbouts < ActiveRecord::Migration
  def change
    create_table :abouts do |t|
      t.string :introduce
      t.integer :men
      t.integer :women

      t.timestamps null: false
    end
  end
end
