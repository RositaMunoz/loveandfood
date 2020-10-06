class ChangeColumnEstablecimiento < ActiveRecord::Migration[5.2]
  def change
      change_column :establecimientos, :valoracion, :string

  end
end
