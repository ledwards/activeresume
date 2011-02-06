class CreatePortfolioItems < ActiveRecord::Migration
  def self.up
    create_table :portfolio_items do |t|
      t.string :title
      t.string :institution_name
      t.string :location
      t.boolean :current
      t.integer :start_month
      t.integer :start_year
      t.integer :end_month
      t.integer :end_year
      t.text :description
      t.string :hyperlink
      
      t.belongs_to :user
      
      t.timestamps
    end
  end

  def self.down
    drop_table :portfolio_items
  end
end
