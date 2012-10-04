class AddLastMaintenanceHourToMaintreport < ActiveRecord::Migration
  def self.up
    add_column :maintreports, :last_maintenance_hour, :decimal
  end

  def self.down
    remove_column :maintreports, :last_maintenance_hour
  end
end
