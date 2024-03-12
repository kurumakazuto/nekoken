class AddRemarksToToilet < ActiveRecord::Migration[6.1]
  def change
    add_column :toilets, :remarks, :string
  end
end
