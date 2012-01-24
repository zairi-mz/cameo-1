class CreateJobdescs < ActiveRecord::Migration
  def self.up
    create_table :jobdescs do |t|
      t.integer :job_code
      t.string :description
      t.text :method

      t.timestamps
    end
  end

  def self.down
    drop_table :jobdescs
  end
end
