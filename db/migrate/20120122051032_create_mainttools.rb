class CreateMainttools < ActiveRecord::Migration
  def self.up
    create_table :mainttools do |t|
      t.integer :maintenance_id
      t.integer :tool_id
      t.integer :updated_by

      t.timestamps
    end
  end

  def self.down
    drop_table :mainttools
  end
end
