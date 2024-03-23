class CreateToilets < ActiveRecord::Migration[6.1]
  def change
    create_table :toilets do |t|
      t.integer :customer_id, null: false
      t.string :name, null: false
      t.string :month, null: false
      t.string :day, null: false
      t.string :day_of_week, null: false
      t.string :time_zone, null: false

      t.timestamps
    end
  end
end
