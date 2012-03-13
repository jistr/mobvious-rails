require "bundler/gem_tasks"
require 'rake/testtask'

task :default => [:test, :'jasmine:ci']

Rake::TestTask.new do |t|
  t.pattern = "spec/**/*_spec.rb"
end

begin
  require 'jasmine'
  load 'jasmine/tasks/jasmine.rake'
rescue LoadError
  task :jasmine do
    abort "Jasmine is not available. In order to run jasmine, you must: gem install jasmine"
  end
end
