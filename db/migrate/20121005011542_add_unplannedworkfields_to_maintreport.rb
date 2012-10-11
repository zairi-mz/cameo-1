class AddUnplannedworkfieldsToMaintreport < ActiveRecord::Migration
  def self.up
    add_column :maintreports, :start_date, :date
    add_column :maintreports, :supplier_id, :integer
    add_column :maintreports, :work_status, :integer
  end

  def self.down
    remove_column :maintreports, :work_status
    remove_column :maintreports, :supplier_id
    remove_column :maintreports, :start_date
  end
end
