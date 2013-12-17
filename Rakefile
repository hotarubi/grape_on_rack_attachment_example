#!/usr/bin/env rake
require File.expand_path('../environment', __FILE__)
require File.expand_path('../lib/exts/rails', __FILE__)
require 'active_support/core_ext/string/strip'

task :rails_env do
end

task :environment do
end

namespace :db do
  include ActiveRecord::Tasks
  DatabaseTasks.database_configuration = YAML.load(File.read('config/database.yml'))
  DatabaseTasks.db_dir = 'db'
  DatabaseTasks.root = Application.config.root
end

Rake.load_rakefile "active_record/railties/databases.rake"
Dir["#{File.dirname(__FILE__)}/lib/tasks/**/*.rake"].each {|f| Rake.load_rakefile f}

task :default => :spec
