describe API::Uploader do
  require 'rack/test'
  include Rack::Test::Methods

  def app
    AppServer
  end

  after do
    NoteFile.find_each do |f|
      f.file.remove!
      Dir.rmdir File.dirname(f.file.path)
    end
  end

  describe "POST /api/files/" do
    let(:file) do
      Rack::Test::UploadedFile.new(
        File.expand_path('../../fixtures/test1.csv', __FILE__)
      )
    end
    before { post "/api/files/", { name: 'report', file: file }  }
    it "should return file object with download url" do
      last_response.body.should == NoteFile.find_by!(name: 'report').to_json
    end
  end

end
