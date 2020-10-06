class RemoveFechaHoraFromComentarios < ActiveRecord::Migration[5.2]
  def change
    remove_column :comentarios, :fecha, :date
    remove_column :comentarios, :hora, :time
  end
end
