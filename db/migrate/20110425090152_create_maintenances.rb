class CreateMaintenances < ActiveRecord::Migration
  def self.up
    create_table :maintenances do |t|
      t.string :code
      t.integer :component_id
      t.string :description
      t.integer :frequency
      t.integer :frequency_unit
      t.integer :level
      t.integer :action_group_id
      t.date :first_date
      t.date :next_date
      t.integer :priority

      t.timestamps
    end
  end

  def self.down
    drop_table :maintenances
  end
end
