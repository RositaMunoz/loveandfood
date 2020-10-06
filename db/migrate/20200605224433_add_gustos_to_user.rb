class AddGustosToUser < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :deporte, :string
  	add_column :users, :musica, :string
  	add_column :users, :comida, :string
  	add_column :users, :genero_pelicula, :string
  end
end
