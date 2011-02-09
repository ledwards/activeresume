class CreatePublications < ActiveRecord::Migration
  def self.up
    create_table :publications do |t|
      t.string :title
      t.string :author
      t.string :publisher
      t.string :publication_date
      t.text :description
      t.string :hyperlink

      t.timestamps

      t.references :user
    end
  end

  def self.down
    drop_table :publications
  end
end
