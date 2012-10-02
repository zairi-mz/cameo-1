class CreatePlanworkparts < ActiveRecord::Migration
  def self.up
    create_table :planworkparts do |t|
      t.integer :maintreport_id
      t.integer :part_id
      t.integer :quantity

      t.timestamps
    end
  end

  def self.down
    drop_table :planworkparts
  end
end
