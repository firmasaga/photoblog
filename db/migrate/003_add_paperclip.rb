class AddPaperclip < ActiveRecord::Migration
  def self.up
    rename_column :photos, :source, :source_file_name
    add_column :photos, :source_content_type, :string
    add_column :photos, :source_file_size, :integer
  end

  def self.down
    rename_column :photos, :source_file_name, :source
    remove_column :photos, :source_content_type
    remove_column :photos, :source_file_size
  end
end
