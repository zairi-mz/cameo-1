class CreateTools < ActiveRecord::Migration
  def self.up
    create_table :tools do |t|
      t.string    :tool_code
      t.string    :name
      t.string    :tool_no
      t.integer   :supplier_id
      t.integer   :manufacturer_id
      t.decimal   :price
      t.integer   :location_id
      t.text      :notes
      t.integer   :tool_class
      
      t.timestamps
    end
  end

  def self.down
    drop_table :tools
  end
end
