class Addvalortocomments < ActiveRecord::Migration[5.2]
  def change
      add_column :comentarios, :rating, :integer
  end
end
