class AddUserToEstablecimiento < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :establecimientos, :users, column: :user_id
  end
end
