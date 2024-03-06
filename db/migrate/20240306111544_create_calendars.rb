class CreateCalendars < ActiveRecord::Migration[6.1]
  def change
    create_table :calendars do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.datetime :start_time

      t.timestamps
    end
  end
end
