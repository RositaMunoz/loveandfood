class AddColumnApp < ActiveRecord::Migration[5.2]
  def change
    add_column :appointments, :wanted, :integer
  end
end
