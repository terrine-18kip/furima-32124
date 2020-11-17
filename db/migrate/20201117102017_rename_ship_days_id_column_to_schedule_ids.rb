class RenameShipDaysIdColumnToScheduleIds < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :ship_days_id, :schedule_id
  end
end
