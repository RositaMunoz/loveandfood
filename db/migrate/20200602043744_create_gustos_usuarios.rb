class CreateGustosUsuarios < ActiveRecord::Migration[5.2]
  def change
    create_table :gustos_users, id: false do |t|
      t.belongs_to :gusto
      t.belongs_to :user
    end
  end
end
