class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.text :text
      t.string :name
      t.integer :photo_id

      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
