class CreatePlanworkhours < ActiveRecord::Migration
  def self.up
    create_table :planworkhours do |t|
      t.integer :maintreport_id
      t.integer :maintgroup_id
      t.decimal :hours
      t.integer :updated_by

      t.timestamps
    end
  end

  def self.down
    drop_table :planworkhours
  end
end
