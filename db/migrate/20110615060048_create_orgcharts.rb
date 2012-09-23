class CreateOrgcharts < ActiveRecord::Migration
  def self.up
    create_table :orgcharts do |t|
      t.string :code
      t.string :name
      t.string :ancestry

      t.timestamps
    end
  end

  def self.down
    drop_table :orgcharts
  end
end
