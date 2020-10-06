class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.date :fecha
      t.integer :match_id
      t.integer :establecimiento_id

      t.timestamps
    end
  end
end
