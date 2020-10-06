class Addcomunaidtousers < ActiveRecord::Migration[5.2]
  def change
      add_column :users, :comuna_id, :int
  end
end
