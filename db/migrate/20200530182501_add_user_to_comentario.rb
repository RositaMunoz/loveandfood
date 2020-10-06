class AddUserToComentario < ActiveRecord::Migration[5.2]
  def change
      add_foreign_key :comentarios, :users, column: :user_id
      add_foreign_key :comentarios, :establecimientos, column: :negocio_id
  end
end
