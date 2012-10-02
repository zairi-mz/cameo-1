class CreatePlanworktools < ActiveRecord::Migration
  def self.up
    create_table :planworktools do |t|
      t.integer :maintreport_id
      t.integer :tool_id

      t.timestamps
    end
  end

  def self.down
    drop_table :planworktools
  end
end
