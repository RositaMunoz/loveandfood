class ChangeColumnAppointmens < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :appointments, column: :petitioner
    rename_column :appointments, :petitioner, :user_id
  end
end
