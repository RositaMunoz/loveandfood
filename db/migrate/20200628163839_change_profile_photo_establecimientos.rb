class ChangeProfilePhotoEstablecimientos < ActiveRecord::Migration[5.2]
  def change
    rename_column :establecimientos, :foto_perfil, :profile_image
  end
end
