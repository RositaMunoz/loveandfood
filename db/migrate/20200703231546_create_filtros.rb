class CreateFiltros < ActiveRecord::Migration[5.2]
  def change
    create_table :filtros do |t|
      t.references :user, foreign_key: true
      t.string :gustos
      t.string :comuna
      t.string :genero
      t.integer :edad_min
      t.integer :edad_max

      t.timestamps
    end
  end
end
