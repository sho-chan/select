class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name
      t.string :address
      t.string :station
      t.string :map_url

      t.timestamps null: false
    end
  end
end
