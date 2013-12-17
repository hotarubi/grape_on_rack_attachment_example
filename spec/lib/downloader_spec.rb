describe Downloader do
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

  let(:note_file) do
    NoteFile.create name: 'report',
                            file: File.open(File.expand_path('../../fixtures/test1.csv', __FILE__))
  end

  it "should send back the file" do
    get note_file.file.url
    last_response.content_type.should == 'text/csv'
    last_response.status.should == 200
    last_response.body.should == note_file.file.read
  end

end
