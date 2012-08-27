class CreateMaintgroups < ActiveRecord::Migration
  def self.up
    create_table :maintgroups do |t|
      t.string :short_name
      t.string :name
      t.integer :quantity
      t.decimal :rate

      t.timestamps
    end
  end

  def self.down
    drop_table :maintgroups
  end
end
