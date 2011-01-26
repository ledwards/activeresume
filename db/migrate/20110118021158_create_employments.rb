class CreateEmployments < ActiveRecord::Migration
  def self.up
    create_table :employments do |t|
      t.string :job_title
      t.string :company_name
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
    drop_table :employments
  end
end
