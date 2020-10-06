class AddComunaToEstablecimiento < ActiveRecord::Migration[5.2]
  def change
      add_foreign_key :establecimientos, :comunas, column: :comuna_id
  end
end
