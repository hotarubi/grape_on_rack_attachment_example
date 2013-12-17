require File.expand_path('../../uploaders/note_file_uploader.rb', __FILE__)

class NoteFile < ActiveRecord::Base

  mount_uploader :file, NoteFileUploader

end
