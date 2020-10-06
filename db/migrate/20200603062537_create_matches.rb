class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
      t.integer :id_matcher
      t.integer :id_matched
      t.boolean :status

      t.timestamps
    end
  end
end
