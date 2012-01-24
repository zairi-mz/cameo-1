class CreateCompparts < ActiveRecord::Migration
  def self.up
    create_table :compparts do |t|
      t.integer :component_id
      t.integer :part_id
      t.integer :quantity
      t.integer :updated_by

      t.timestamps
    end
  end

  def self.down
    drop_table :compparts
  end
end
