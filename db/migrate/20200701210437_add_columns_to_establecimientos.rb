class AddColumnsToEstablecimientos < ActiveRecord::Migration[5.2]
  def change
    add_column :establecimientos, :adress, :string
    add_column :establecimientos, :latitude, :float
    add_column :establecimientos, :longitude, :float
  end
end
