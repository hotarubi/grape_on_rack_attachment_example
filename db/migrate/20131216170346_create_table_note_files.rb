class CreateTableNoteFiles < ActiveRecord::Migration
  def self.up
    create_table :note_files do |t|
      t.string :file
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :note_files
  end
end
