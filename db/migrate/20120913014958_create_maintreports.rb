class CreateMaintreports < ActiveRecord::Migration
  def self.up
    create_table :maintreports do |t|
      t.integer :maintenance_id
      t.date :done_date
      t.text :add_notes

      t.timestamps
    end
  end

  def self.down
    drop_table :maintreports
  end
end
