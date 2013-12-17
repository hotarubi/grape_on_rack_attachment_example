require File.expand_path('../environment', __FILE__)

module API
end

require 'app/api/uploader'

AppServer = Rack::Builder.new {
  use Rack::Sendfile
  use ActiveRecord::ConnectionAdapters::ConnectionManagement
  use Rack::Session::Pool, cookie_only: false, defer: true

  map "/api" do
    run API::Uploader
  end

  map "/download" do
    run Downloader.new
  end
}
