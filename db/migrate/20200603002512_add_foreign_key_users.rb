class AddForeignKeyUsers < ActiveRecord::Migration[5.2]
  def change
      add_foreign_key :users, :comunas, column: :comuna_id
  end
end
