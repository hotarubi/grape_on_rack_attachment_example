Dir["#{File.dirname(__FILE__)}/../models/**/*.rb"].each {|f| require f}

class API::Uploader < Grape::API
  format :json

  resource :files do

    desc "create new note file"
    params do
      requires :name, type: String
      requires :file, type: Rack::Multipart::UploadedFile
    end
    post do
      NoteFile.create! params
    end
  end

end
