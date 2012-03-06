require 'bundler/gem_tasks'
require "rspec/core/rake_task"

task :default => [:spec]

RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = Dir.glob('spec/**/*_spec.rb')
  t.rspec_opts = ['--backtrace']
end