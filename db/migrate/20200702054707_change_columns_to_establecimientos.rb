class ChangeColumnsToEstablecimientos < ActiveRecord::Migration[5.2]
  def change
    rename_column :establecimientos, :profile_image, :images
  end
end
