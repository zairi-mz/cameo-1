class CreateParts < ActiveRecord::Migration
  def self.up
    create_table :parts do |t|
      t.string :part_code
      t.string :name
      t.string :part_no
      t.integer :supplier_id
      t.integer :manufacturer_id
      t.decimal :price
      t.integer :location_id
      t.text :notes
      t.integer   :tool_class

      t.timestamps
    end
  end

  def self.down
    drop_table :parts
  end
end
