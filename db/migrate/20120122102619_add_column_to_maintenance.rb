class AddColumnToMaintenance < ActiveRecord::Migration
  def self.up
    add_column :maintenances, :jobdesc_id, :integer
  end

  def self.down
    remove_column :maintenances, :Jobdesc_id
  end
end
