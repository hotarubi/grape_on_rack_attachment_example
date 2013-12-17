require 'carrierwave/orm/activerecord'

db_config = YAML.load(ERB.new(File.read("config/database.yml")).result)[Application.config.env]
ActiveRecord::Base.default_timezone = :local
ActiveRecord::Base.establish_connection(db_config)
