class CreateEducations < ActiveRecord::Migration
  def self.up
    create_table :educations do |t|
      t.string :major
      t.string :institution_name
      t.string :location
      t.boolean :current
      t.integer :start_month
      t.integer :start_year
      t.integer :end_month
      t.integer :end_year
      t.text :summary
      
      t.references :user
      
      t.timestamps
    end
  end

  def self.down
    drop_table :educations
  end
end
