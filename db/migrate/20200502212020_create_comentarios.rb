class CreateComentarios < ActiveRecord::Migration[5.2]
  def change
    create_table :comentarios do |t|
      t.string :mensaje
      t.integer :user_id
      t.integer :negocio_id
      t.date :fecha
      t.time :hora

      t.timestamps
    end
  end
end
