class AddAceptadoToEstablecimientos < ActiveRecord::Migration[5.2]
  def change
    add_column :establecimientos, :aceptado, :string
  end
end
