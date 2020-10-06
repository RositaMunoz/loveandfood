class CreateEstablecimientos < ActiveRecord::Migration[5.2]
  def change
    create_table :establecimientos do |t|
      t.string :nombre
      t.string :tipo
      t.string :descripcion
      t.float :valoracion
      t.integer :user_id
      t.integer :comuna_id

      t.timestamps
    end
  end
end
