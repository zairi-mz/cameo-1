class RenameDepartmentIdToOrgchartIdInLocation < ActiveRecord::Migration
  def self.up
    rename_column :locations, :department_id, :orgchart_id
  end

  def self.down
    rename_column :locations, :orgchart_id, :department_id
  end
end
