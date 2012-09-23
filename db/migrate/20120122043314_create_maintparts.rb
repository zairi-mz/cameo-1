class CreateMaintparts < ActiveRecord::Migration
  def self.up
    create_table :maintparts do |t|
      t.integer :maintenance_id
      t.integer :part_id
      t.integer :quantity
      t.integer :updated_by

      t.timestamps
    end
  end

  def self.down
    drop_table :maintparts
  end
end
