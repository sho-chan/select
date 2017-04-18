class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.string :January
      t.string :Februarystring
      t.string :Maarch
      t.string :April
      t.string :May
      t.string :June
      t.string :July
      t.string :August
      t.string :September
      t.string :October
      t.string :November
      t.string :December

      t.timestamps null: false
    end
  end
end
