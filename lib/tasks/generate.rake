namespace :generate do
  desc "Generate migration. Specify name in the NAME variable"
  task :migration => :environment do
    name = ENV['NAME'] || raise("Specify name: rake g:migration NAME=create_users")
    timestamp = Time.now.strftime("%Y%m%d%H%M%S")

    path = "#{Application.config.root}/db/migrate/#{timestamp}_#{name}.rb"
    migration_class = name.split("_").map(&:capitalize).join

    File.open(path, 'w') do |file|
      file.write <<-EOF.strip_heredoc
        class #{migration_class} < ActiveRecord::Migration
          def self.up
          end

          def self.down
          end
        end
      EOF
    end

    puts "DONE"
    puts path
  end
end
