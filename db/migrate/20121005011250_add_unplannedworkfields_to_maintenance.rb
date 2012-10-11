class AddUnplannedworkfieldsToMaintenance < ActiveRecord::Migration
  def self.up
    add_column :maintenances, :work_type, :integer
    add_column :maintenances, :date_report, :date
    add_column :maintenances, :date_to_start, :date
    add_column :maintenances, :date_to_finish, :date
    add_column :maintenances, :reported_by, :integer
  end

  def self.down
    remove_column :maintenances, :reported_by
    remove_column :maintenances, :date_to_finish
    remove_column :maintenances, :date_to_start
    remove_column :maintenances, :date_report
    remove_column :maintenances, :work_type
  end
end
