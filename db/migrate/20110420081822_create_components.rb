class CreateComponents < ActiveRecord::Migration
  def self.up
    create_table :components do |t|
      t.string :component_code
      t.integer :parent_id
      t.string :name
      t.integer :location_id
      t.string :type_no
      t.string :serial_no
      t.date :installed_on
      t.integer :manufacturer_id
      t.integer :supplier_id
      t.text :tech_description
      t.integer :counter_id
      t.integer :unit_id
      t.integer :created_by

      t.timestamps
    end
  end

  def self.down
    drop_table :components
  end
end
