class AddColumnAppointments < ActiveRecord::Migration[5.2]
  def change
    add_column :appointments, :petitioner, :string
  end
end
