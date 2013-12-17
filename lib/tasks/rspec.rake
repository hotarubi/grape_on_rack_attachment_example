# source: https://github.com/rspec/rspec-rails/blob/master/lib/rspec/rails/tasks/rspec.rake
require 'rspec/core/rake_task'
if default = Rake.application.instance_variable_get('@tasks')['default']
  default.prerequisites.delete('test')
end

spec_prereq =  "test:prepare"

desc "Run all specs in spec directory (excluding plugin specs)"
RSpec::Core::RakeTask.new(:spec => spec_prereq)

namespace :spec do
  types = begin
            dirs = Dir['./spec/**/*_spec.rb'].
              map { |f| f.sub(/^\.\/(spec\/\w+)\/.*/, '\\1') }.
              uniq.
              select { |f| File.directory?(f) }
            Hash[dirs.map { |d| [d.split('/').last, d] }]
          end

  types.each do |type, dir|
    desc "Run the code examples in #{dir}"
    RSpec::Core::RakeTask.new(type => spec_prereq) do |t|
      t.pattern = "./#{dir}/**/*_spec.rb"
    end
  end
end
