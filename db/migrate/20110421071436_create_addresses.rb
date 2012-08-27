class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.string :company
      t.string :web
      t.text :address
      t.string :fax
      t.string :phone
      t.string :email
      t.text :notes

      t.timestamps
    end
  end

  def self.down
    drop_table :addresses
  end
end
