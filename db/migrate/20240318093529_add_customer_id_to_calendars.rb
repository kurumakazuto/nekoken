class AddCustomerIdToCalendars < ActiveRecord::Migration[6.1]
  def change
    add_column :calendars, :customer_id, :integer
  end
end
