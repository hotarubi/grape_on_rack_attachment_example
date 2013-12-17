module Rails
  def self.application
    Struct.new(:config, :paths) do
      def load_seed
        require "#{root}/application"
        require "#{root}/db/seeds"
      end
    end.new(config, paths)
  end

  def self.config
    require 'erb'
    db_config = YAML.load(ERB.new(File.read("#{root}/config/database.yml")).result)
    Struct.new(:database_configuration).new(db_config)
  end

  def self.paths
    { 'db/migrate' => ["#{root}/db/migrate"] }
  end

  def self.env
    env = ENV['RACK_ENV'] || "development"
    ActiveSupport::StringInquirer.new(env)
  end

  def self.root
    Application.config.root
  end
end
