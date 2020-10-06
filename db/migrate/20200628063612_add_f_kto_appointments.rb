class AddFKtoAppointments < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :appointments, :users, column: :user_id
  end
end
