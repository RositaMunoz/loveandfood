class ChangeColumnsMatch < ActiveRecord::Migration[5.2]
  def change
    rename_column :matches, :id_matcher, :matcher_id
    rename_column :matches, :id_matched, :matched_id
  end
end
