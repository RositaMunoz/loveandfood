class AddpictureEstablecimiento < ActiveRecord::Migration[5.2]
  def change
  	add_column :establecimientos, :foto_perfil, :string
  end
end
