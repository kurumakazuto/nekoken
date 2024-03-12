class AddRemarksToFood < ActiveRecord::Migration[6.1]
  def change
    add_column :foods, :remarks, :string
  end
end
