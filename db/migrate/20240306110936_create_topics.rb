class CreateTopics < ActiveRecord::Migration[6.1]
  def change
    create_table :topics do |t|
      t.integer :customer_id, null: false
      t.string :title, null: false
      t.text :introduction, null: false

      t.timestamps
    end
  end
end
