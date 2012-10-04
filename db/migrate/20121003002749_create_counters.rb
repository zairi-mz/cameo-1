class CreateCounters < ActiveRecord::Migration
  def self.up
    create_table :counters do |t|
      t.integer :component_id
      t.date :date_run
      t.decimal :run_hours
      t.text :notes

      t.timestamps
    end
  end

  def self.down
    drop_table :counters
  end
end
