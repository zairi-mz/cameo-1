class AddAncestryToComponents < ActiveRecord::Migration
  def self.up
    add_column :components, :ancestry, :string
    add_index  :components, :ancestry
    remove_column :components, :parent_id
  end

  def self.down
    remove_index  :components, :ancestry
    remove_column :components, :ancestry
  end
end
