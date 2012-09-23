class RemoveParentIdFromComponents < ActiveRecord::Migration
  def self.up
    remove_column :components, :parent_id
    add_column    :components, :edited_by, :integer
  end

  def self.down
    remove_column :components, :edited_by
    add_column    :components, :parent_id, :integer
  end
end
