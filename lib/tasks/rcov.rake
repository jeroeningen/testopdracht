require 'rspec/core/rake_task'
require 'cucumber/rake/task'


vendored_cucumber_bin = Dir["#{Rails.root}/vendor/{gems,plugins}/cucumber*/bin/cucumber"].first
$LOAD_PATH.unshift(File.dirname(vendored_cucumber_bin) + '/../lib') unless vendored_cucumber_bin.nil?

namespace :rcov do
  RSpec::Core::RakeTask.new(:rspec => 'db:test:prepare') do |t|
    t.rcov = true
    t.rcov_opts = "--exclude osx\/objc,gems\/"
  end
  
  Cucumber::Rake::Task.new({:cucumber => 'db:test:prepare'}, 'Run features that should pass') do |t|
    t.binary = vendored_cucumber_bin 
    t.fork = true # You may get faster startup if you set this to false
    t.rcov = true
    t.profile = 'default'
  end
end
