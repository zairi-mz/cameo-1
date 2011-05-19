class CreateDocuments < ActiveRecord::Migration
  def self.up
    create_table :documents do |t|
      t.string :doc_code
      t.string :title
      t.string :publisher

      t.timestamps
    end
  end

  def self.down
    drop_table :documents
  end
end
