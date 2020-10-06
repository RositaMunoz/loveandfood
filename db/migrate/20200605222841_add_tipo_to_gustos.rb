class AddTipoToGustos < ActiveRecord::Migration[5.2]
  def change
    add_column :gustos, :tipo, :string
  end
end
