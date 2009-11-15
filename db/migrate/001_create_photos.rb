class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
      t.string :image
      t.string :title
      t.string :source

      t.timestamps
    end
  end

  def self.down
    drop_table :photos
  end
end
