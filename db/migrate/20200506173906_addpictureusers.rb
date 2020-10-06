class Addpictureusers < ActiveRecord::Migration[5.2]
  def change
      add_column :users, :foto_perfil,:string
  end
end
