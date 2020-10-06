class AddColumnEstablec < ActiveRecord::Migration[5.2]
  def change
    add_column :establecimientos, :profile_image, :string
    remove_column :establecimientos, :latitude
    remove_column :establecimientos, :longitude
  end
end
