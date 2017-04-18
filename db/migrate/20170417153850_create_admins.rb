class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :password
      t.string :address

      t.timestamps null: false
    end
  end
end
