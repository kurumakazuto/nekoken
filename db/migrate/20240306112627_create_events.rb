class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.integer :food_id, null: false
      t.integer :toilet_id, null: false
      t.string :month, null: false
      t.string :day, null: false
      t.string :day_of_week, null: false

      t.timestamps
    end
  end
end
