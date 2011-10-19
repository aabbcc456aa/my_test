class CreateFileUploads < ActiveRecord::Migration
  def self.up
    create_table :file_uploads do |t|
      t.string :name
      t.string :url
      t.string :file_type

      t.timestamps
    end
  end

  def self.down
    drop_table :file_uploads
  end
end
