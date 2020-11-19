class RenameShipAreaIdColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :ship_area_id, :prefecture_id
  end
end
