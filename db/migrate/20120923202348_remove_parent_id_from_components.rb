class RemoveParentIdFromComponents < ActiveRecord::Migration
  def self.up
    remove_column :components, :parent_id
  end

  def self.down
    add_column  :components, :parent_id
  end
end
