CarrierWave.root = "#{Application.config.root}/uploads"
CarrierWave.configure do |config|
  config.asset_host = proc do |file|
    # Path depends on the Nginx config
    "#{Application.config.base_path}/download"
  end

  config.enable_processing = Application.config.test?
end
