class AddFkToUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :appointments, :petitioner, :integer, using: 'petitioner::integer'
    remove_column :appointments, :wanted, :string
    add_foreign_key :appointments, :users, column: :petitioner
  end
end
