class Downloader

  def call(env)
    @env = env
    return failure unless file_ready
    serve_file
  end

  private
  def failure
    [ 404,
      { 'Content-Type' => 'application/json' },
      [ { error: "File Not Found" }.to_json ]
    ]
  end

  def serve_file
    file = Rack::File.new nil
    file.path = file_path
    file.serving @env
  end

  def file_ready
    File.file?(file_path) and File.readable?(file_path)
  end

  def file_path
    @file_path ||= CarrierWave.root + request_path
  end

  def request_path
    @path ||= (@env['REQUEST_PATH'] || @env['PATH_INFO']).gsub("/download", '')
  end

end
