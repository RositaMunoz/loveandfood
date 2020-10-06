class AddColumnsToAppointments < ActiveRecord::Migration[5.2]
  def change
    add_column :appointments, :status, :boolean
    add_column :appointments, :accomplished, :boolean
    add_column :appointments, :hora, :time
  end
end
