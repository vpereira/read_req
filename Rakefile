require 'rake/testtask'


Rake::TestTask.new do |t|
    t.libs.push [".","test"]
    t.test_files = FileList['test/*_spec.rb']
    t.verbose = true
end

namespace :test do
      desc "test coverage report"
      task :coverage do
        Rake::Task["test"].execute
      end
end

task :default=> :test
