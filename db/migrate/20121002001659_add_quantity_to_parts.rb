class AddQuantityToParts < ActiveRecord::Migration
  def self.up
    add_column :parts, :quantity, :integer, :default => 0
  end

  def self.down
    remove_column :parts, :quantity
  end
end
