class AddanotherColumnAppointments < ActiveRecord::Migration[5.2]
  def change
    add_column :appointments, :wanted, :string
  end
end
