class CreateProfiles < ActiveRecord::Migration
  def self.up
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :middle_name
      t.text :summary
      t.string :address_line_1
      t.string :address_line_2
      t.string :city
      t.string :state
      t.integer :zip_code
      t.string :phone
      t.string :email
      t.string :website
      
      t.references :user
      t.timestamps
    end
  end

  def self.down
    drop_table :profiles
  end
end
