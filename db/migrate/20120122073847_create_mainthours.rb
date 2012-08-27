class CreateMainthours < ActiveRecord::Migration
  def self.up
    create_table :mainthours do |t|
      t.integer :maintenance_id
      t.integer :maintgroup_id
      t.decimal :hours
      t.integer :updated_by

      t.timestamps
    end
  end

  def self.down
    drop_table :mainthours
  end
end
