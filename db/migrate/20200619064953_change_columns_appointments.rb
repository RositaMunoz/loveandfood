class ChangeColumnsAppointments < ActiveRecord::Migration[5.2]
  def change
    change_column :appointments, :status, :boolean, :default => false
    change_column :appointments, :accomplished, :boolean, :default => false
  end
end
