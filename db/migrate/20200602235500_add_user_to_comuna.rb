class AddUserToComuna < ActiveRecord::Migration[5.2]
  def change
      remove_foreign_key :users, column: :comuna_id
  end
end
